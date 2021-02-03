class ReviewsController < ApplicationController
    
    before_action :find_user
    before_action :find_review, only: :show
    
    def new
        @review = @user.reviews.build
    end

    def create 
        @review = @user.reviews.build(review_params)
        if @review.save
            redirect_to user_path(@user)
        else
            flash.now[:error] = @review.errors.full_messages
            render :new
        end
    end

    def show
    end

    private

    def review_params
        params.require(:review).permit(:comment, :skill_id, :author)
    end

    def find_user
        @user = User.find(params[:user_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end

end
