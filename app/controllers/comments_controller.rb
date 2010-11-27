class CommentsController < ApplicationController

  respond_to :html, :xml
  def index
    @comments = Comment.all
    respond_with @comments
  end
  
  def show
    @comment = Comment.find(params[:id])
    respond_with @comment
    
  end
  
  def new
    @comment = Comment.new
    respond_with @product
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      cookies[:last_comment_id] = @comment.id
      flash[:notice] = "Successfuly created comment"
    end
    respond_with(@comment)
  end
  
  def edit
    @comment = Comment.find(params[:id])
    respond_with(@comment)
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment"
    end
    respond_with(@comment)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfuly deleted comment"
    respond_with(@comment)
    
  end

end
