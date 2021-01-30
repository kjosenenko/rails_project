class BidsController < ApplicationController

    before_action :find_listing
    before_action :find_bid, only: [:show, :edit, :update, :destroy]

    def index 
    end

    def show 
    end

    def new
        @bid = @listing.bids.build
    end

    def create 
        @bid = @listing.bids.build(bid_params)
        if @bid.save
            redirect_to listing_bid_path(@listing, @bid)
        else
            flash.now[:error] = @bid.errors.full_messages
            render :new
        end

    end

    def edit 
    end

    def update
    end

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

    def bid_params
        params.require(:bid).permit(:amount, :message, :user_id)
    end
end
