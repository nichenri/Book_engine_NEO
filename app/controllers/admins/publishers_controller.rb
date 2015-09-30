class Admins::PublishersController < AdminsController
  before_action :set_publisher, only: [:edit, :update, :destroy] 

  def index
    @publishers = Publisher.all
    @publisher = Publisher.new
  end

  def create
    Publisher.create(publisher_params)
    redirect_to admins_publishers_path
  end

  def edit
  end

  def update
    @publisher.update(publisher_params) 
    redirect_to admins_publishers_path
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
