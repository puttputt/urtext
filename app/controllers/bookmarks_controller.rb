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
    respond_with @user
	
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    flash[:notice] = "Successfuly deleted bookmark"
    respond_with(@bookmark)
    
  end
  
end
