class BidsController < ApplicationController

    helper_method :owns_bid?

    before_action :find_listing, except: [:my_bids, :bids_on_my_listings]
    before_action :find_bid, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:my_bids, :new, :create, :show, :bids_on_my_listings]
    before_action :require_owns_listing, only: [:index]
    before_action :require_owns_bid, only: [:edit, :update, :destroy]

    # IS USER (listing)
    def index
        @bids = @listing.bids
    end

    # logged in
    def my_bids
        @bids = Bid.where(user_id: current_user.id)
        render :index
    end

    # logged in
    def bids_on_my_listings
        @bids = current_user.bids_on_my_listings
        render :index
    end

    # IS USER (either)
    def show 
        if owns_bid? || owns_listing?
            render :show
        else
            redirect_to '/listings/index'
        end
    end

    # logged in
    def new
        @bid = @listing.bids.build
    end

    # logged in
    def create 
        @bid = @listing.bids.build(bid_params)
        if @bid.save
            redirect_to listing_bid_path(@listing, @bid)
        else
            flash.now[:error] = @bid.errors.full_messages
            render :new
        end

    end

    # IS USER (bid)
    def edit 
    end

    # IS USER (bid)
    def update
    end
    
    # IS USER (bid)
    def destroy
        @bid.delete
        flash[:notice] = "Bid for '#{@listing.title}' was deleted."
        redirect_to listing_path(@listing)
    end

    private

    def find_listing
        @listing = Listing.find(params[:listing_id])
    end

    def find_bid
        @bid = Bid.find(params[:id])
    end

    def require_owns_bid
        redirect_to controller: 'listings', action: 'index' unless owns_bid?
    end

    def owns_bid?
        current_user == @bid.user
    end

    def bid_params
        params.require(:bid).permit(:amount, :message, :user_id)
    end
end
