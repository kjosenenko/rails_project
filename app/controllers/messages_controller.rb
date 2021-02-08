class MessagesController < ApplicationController
    
    before_action :find_conversation
    before_action :require_login
    before_action :require_in_conversation
    before_action :other_users

    def new
        @message = @conversation.messages.build
    end

    def create
        @message = @conversation.messages.build(message_params)
        @message.sender = current_user.username
        if @message.save
            redirect_to conversation_path(@conversation)
        else
            flash.now[:error] = @message.errors.full_messages
            render :new
        end
    end

    private

    def message_params
        params.require(:message).permit(:message)
    end

    def find_conversation
        @conversation = Conversation.find(params[:conversation_id])
    end

end
 