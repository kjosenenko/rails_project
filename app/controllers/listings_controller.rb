class ListingsController < ApplicationController
    
    before_action :find_listing, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:my_listings, :new, :create]
    before_action :require_owns_listing, only: [:edit, :update, :destroy]
    
    # all
    def index 
        @listings = Listing.all
    end

    def find
        @listings = Listing.search(params[:query])
        render :index
    end
    
    # logged in
    def my_listings
        @listings = Listing.where(user_id: current_user.id)
        render :index
    end

    # all 
    def show
    end

    # logged in
    def new
        @listing = Listing.new
    end

    # logged in
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

    # IS USER
    def edit
    end

    # IS USER
    def update
        if @listing.update(listing_params)
            redirect_to listing_path(@listing)
        else
            flash.now[:error] = @listing.errors.full_messages
            render :edit
        end
    end
    
    # IS USER
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
