class Admins::BookmarksController < AdminsController

  def index
    @bookmark_search = Bookmark.search(params[:q])
    @bookmarks = @bookmark_search.result
  end

end 

