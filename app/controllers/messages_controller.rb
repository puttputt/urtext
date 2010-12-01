class MessagesController < ApplicationController
  before_filter :require_user
  respond_to :html, :xml
  layout 'layouts/default'
  def index
    @messages = Message.find_all_by_user_id(current_user, :include=> :user)
    respond_with @messages
  end
  
  def show
    @message = Message.find(params[:id])
    @user = User.find_by_id(@message.from_id)
    respond_with @message
    
  end
  
  def new
    @message = Message.new
    if params[:id]
      @username = params[:id]
    else
      @username = ''
    end
    respond_with @product
  end
  
  def create
    @message = Message.new(params[:message])
    @message.from_id = current_user.id
    @user = User.find_by_login(params[:username])
    if @user
      @message.user_id = @user.id
      if @message.save
        cookies[:last_message_id] = @message.id
        flash[:notice] = "Successfuly sent message"
      end
    else
      flash[:notice] = "User does not exist"
    end
    respond_with(@message, :location => users_url)
  end
  
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "Successfuly deleted message"
    respond_with(@message)
    
  end
  
end
