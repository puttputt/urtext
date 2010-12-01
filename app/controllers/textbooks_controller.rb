class TextbooksController < ApplicationController
layout 'default'
before_filter :require_user, :only => [:new, :create]
respond_to :html, :xml
  def index
    @textbooks = Textbook.all
    respond_with @textbooks
  end
  
  def show
    @textbook = Textbook.find(params[:id])
    respond_with @textbook
    
  end
  
  def new
    @textbook = Textbook.new
    respond_with @product
  end
  
  def create
    @textbook = Textbook.new(params[:textbook])
    if @textbook.save
      cookies[:last_textbook_id] = @textbook.id
      flash[:notice] = "Successfuly added textbook"
    end
    respond_with(@textbook)
  end
  
  def edit
    @textbook = Textbook.find(params[:id])
    respond_with(@textbook)
  end
  
  def update
    @textbook = Textbook.find(params[:id])
    if @textbook.update_attributes(params[:textbook])
      flash[:notice] = "Successfully updated textbook"
    end
    respond_with(@textbook)
  end
  
  def destroy
    @textbook = Textbook.find(params[:id])
    @textbook.destroy
    flash[:notice] = "Successfuly deleted textbook"
    respond_with(@textbook)
    
  end

end
