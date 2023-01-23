class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
  end

  private

  def listing_params
    params.require(:listing).permit(:comment, :book_id, :list_id)
  end
end
