class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:comment, :book_id, :list_id)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
