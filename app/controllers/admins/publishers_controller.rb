class Admins::PublishersController < AdminsController
  before_action :set_publisher, only: [:edit, :update, :destroy] 

  def index
    @publishers = Publisher.all
    @publisher = Publisher.new
  end

  def create
    if Publisher.create(publisher_params)
      redirect_to admins_publishers_path, notice: "新たな出版社を追加しました"
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params) 
      redirect_to admins_publishers_path, notice: "出版社情報を更新しました"
    end
  end

  def destroy
    @publisher.destroy
    redirect_to admins_publishers_path
  end


  private

    def publisher_params
      params.require(:publisher).permit(:publisher_name)
    end

    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

end
