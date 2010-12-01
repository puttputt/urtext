class TextbooksController < ApplicationController
layout 'default'
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
      flash[:notice] = "Successfuly created ad"
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
      flash[:notice] = "Successfully updated ad"
    end
    respond_with(@textbook)
  end
  
  def destroy
    @textbook = Textbook.find(params[:id])
    @textbook.destroy
    flash[:notice] = "Successfuly deleted ad"
    respond_with(@textbook)
    
  end

end
