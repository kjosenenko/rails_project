class ConversationsController < ApplicationController
    
    def show
        @conversation = Conversation.find(params[:id])
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

    private

    def conversation_params
        params.require(:conversation).permit(messages_attributes: [:message, :sender], participants_attributes: [:user_id])
    end
end
