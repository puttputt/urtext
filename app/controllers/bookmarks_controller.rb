class BookmarksController < ApplicationController

   respond_to :html, :xml
  def index
    @bookmarks = Bookmark.all
    respond_with @bookmarks
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])
    respond_with @bookmark
    
  end
  
  def new
    @bookmark = Bookmark.new
    respond_with @product
  end
  
  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
      cookies[:last_bookmark_id] = @bookmark.id
      flash[:notice] = "Successfuly created bookmark"
    end
    respond_with(@bookmark)
  end
  
  def edit
    @bookmark = Bookmark.find(params[:id])
    respond_with(@bookmark)
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(params[:bookmark])
      flash[:notice] = "Successfully updated bookmark"
    end
    respond_with(@bookmark)
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    flash[:notice] = "Successfuly deleted bookmark"
    respond_with(@bookmark)
    
  end
  
end
