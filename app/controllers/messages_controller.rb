class MessagesController < ApplicationController

  respond_to :html, :xml
  def index
    @messages = Message.all
    respond_with @messages
  end
  
  def show
    @message = Message.find(params[:id])
    respond_with @message
    
  end
  
  def new
    @message = Message.new
    respond_with @product
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      cookies[:last_message_id] = @message.id
      flash[:notice] = "Successfuly created message"
    end
    respond_with(@message)
  end
  
  def edit
    @message = Message.find(params[:id])
    respond_with(@message)
  end
  
  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      flash[:notice] = "Successfully updated message"
    end
    respond_with(@message)
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "Successfuly deleted message"
    respond_with(@message)
    
  end
  
end
