class ListingsController < ApplicationController
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
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    if @listing.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:comment, :book_id, :list_id)
  end
end
