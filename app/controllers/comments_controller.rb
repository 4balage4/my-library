class CommentsController < ApplicationController
  before_action :set_book, only: [:new, :create, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book = @book
    # I deleted the two id-s
    if @comment.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :review, :rating)
  end
end
