class Admins::NewBooksController < Admins::ApplicationController

  def index
    @addition_search = Addition.search(params[:q])
    @additions = @addition_search.result
  end

end
