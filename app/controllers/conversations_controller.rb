class ConversationsController < ApplicationController
    
    before_action :find_conversation, only: [:show, :destroy]

    def index
    end

    def show
        @other_users = other_users
    end
    
    def new
        @recipient = User.find(params[:user_id])
        @conversation = Conversation.new
        @conversation.messages.build
        @conversation.participants.build(user_id: params[:id])
    end

    def create 
        @conversation = Conversation.new(conversation_params)
        if @conversation.save
            Participant.create(conversation_id: @conversation.id, user_id: current_user.id)
            redirect_to conversation_path(@conversation)
        else
            flash[:error] = ["Your message could not be sent, please try again."]
            render :new
        end
    end

    def destroy
        @conversation.participants.destroy_all
        @conversation.messages.destroy_all
        @conversation.delete
        redirect_to conversations_path
    end

    private

    def conversation_params
        params.require(:conversation).permit(messages_attributes: [:message, :sender], participants_attributes: [:user_id])
    end

    def find_conversation
        @conversation = Conversation.find(params[:id])
    end
end
