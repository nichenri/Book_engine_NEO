class Admins::PublishersController < AdminsController
  before_action :set_publisher, only: [:edit, :update, :destroy] 
  before_action :set_admin, only: [:create, :update, :destroy]


  def index
    @publishers = Publisher.all
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save 
      redirect_to admins_publishers_path
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params) 
      redirect_to admins_publishers_path
    else 
      render 'edit'
    end
  end

  def destroy
    @publisher.destroy
    redirect_to admins_publishers_path
  end


  private

    def set_admin
      @admin = current_admin
    end

    def publisher_params
      params.require(:publisher).permit(:publisher_name)
    end

    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

end
