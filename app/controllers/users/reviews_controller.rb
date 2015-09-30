class Users::ReviewsController < UsersController
  before_action :set_book
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @book.reviews.create(review_params)
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to users_book_path(@review.book_id)
  end

  def destroy
    @review.destroy
    redirect_to users_book_path(@review.book_id)
  end

  private 

    def set_review
      @review = @book.reviews.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      @user = current_user
      params.require(:review).permit(:content).merge(user_id: @user.id)
    end
end
