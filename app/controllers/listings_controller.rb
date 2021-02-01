class ListingsController < ApplicationController
    
    before_action :find_listing, only: [:show, :edit, :update, :destroy]

    def index 
        @listings = Listing.all
    end

    def my_listings
        @listings = Listing.where(user_id: current_user.id)
        render :index
    end

    def show
    end

    def new
        @listing = Listing.new
    end

    def create 
        user = current_user
        @listing = user.listings.build(listing_params)
        if @listing.save
            redirect_to listing_path(@listing)
        else
            flash.now[:error] = @listing.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        if @listing.update(listing_params)
            redirect_to listing_path(@listing)
        else
            flash.now[:error] = @listing.errors.full_messages
            render :edit
        end
    end

    def destroy
        @listing.delete
        flash[:notice] = "'#{@listing.title}' was deleted."
        redirect_to listings_path
    end

    private

    def find_listing
        @listing = Listing.find(params[:id])
    end

    def listing_params
        params.require(:listing).permit(:title, :description)
    end
end
