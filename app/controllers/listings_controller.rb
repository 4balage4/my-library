class ListingsController < ApplicationController
  before_action :set_book, only: [:new, :create]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    # checks if we are on the book page or the listings page
    @listing.book_id.nil? ? @listing.book_id = params[:book_id] : ""
    @listing.list_id.nil? ? @listing.list_id = params[:list_id] : ""
    if params[:book_id]
      if @listing.save
        redirect_to book_path(@listing.book)
      else
        render :new, status: :unprocessable_entity
      end
    else
      if @listing.save
        redirect_to list_path(@listing.list)
      else
        render :new, status: :unprocessable_entity
      end
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

  # I kept the route for listings/new. But if there is a book_id in the params
  # because that means we are on the book/:id page and then I want to set the book
  def set_book
    params.key?(:book_id) ? @book = Book.find(params[:book_id]) : ""
  end


  def set_listing
    @listing = Listing.find(params[:id])
  end
end
