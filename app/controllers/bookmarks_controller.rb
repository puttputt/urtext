class BookmarksController < ApplicationController

   respond_to :html, :xml
   before_filter :require_user

  
  def new
    @bookmark = Bookmark.new
	if(Ad.find_by_id(params[:id]))
		@bookmark.user_id = current_user.id
		@bookmark.ad_id = params[:id]
		@bookmark.save
	end
    redirect_to ad_path(params[:id])
	
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    if(current_user.id = @bookmark.user_id)
      @bookmark.destroy
      flash[:notice] = "Successfuly deleted bookmark"
    end
    redirect_to users_path
    
  end
  
end
