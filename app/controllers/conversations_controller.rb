class ConversationsController < ApplicationController
    
    before_action :require_login
    before_action :find_conversation, only: [:show, :destroy]
    before_action :require_in_conversation, only: [:show, :destroy]
    before_action :other_users, only: :show

    def index
        @conversations = current_user.conversations
    end

    def show
        @messages = @conversation.messages.descending
    end
    
    def new
        @recipient = User.find(params[:user_id])
        @conversation = Conversation.new
        @conversation.messages.build
        @conversation.participants.build(user_id: params[:id])
    end

    def create 
        @conversation = Conversation.new(conversation_params)
        @message = @conversation.messages.last
        if @conversation.save
            Participant.create(conversation_id: @conversation.id, user_id: current_user.id)
            redirect_to conversation_path(@conversation)
        else
            @user = User.find(params[:conversation][:participants_attributes]['0'][:user_id])
            @skills = Skill.all
            flash.now[:error] = @message.errors.full_messages
            render 'users/show'
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
