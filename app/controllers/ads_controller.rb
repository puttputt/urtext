class AdsController < ApplicationController
  respond_to :html, :xml
  before_filter :current_user, :current_user_session
  before_filter :require_user, :only => [:new, :create, :update, :destroy]
  layout 'default'
  
  def index
    @ads = Ad.all(:joins => :textbook, :include => :user)
    respond_with @ads
  end
  
  def show
    @ad = Ad.find(params[:id], :joins => :textbook)
    @user = User.find(@ad.user_id)
    respond_with @ad
    
  end
  
  def new
    @ad = Ad.new
    @textbook = Textbook.find(params[:id])
    respond_with (@ad, @textbook)
  end
  
  def create
    @ad = Ad.new(params[:ad])
    @ad.user_id = current_user.id
    @textbook = Textbook.find(@ad.textbook_id)
    if @ad.save
      cookies[:last_ad_id] = @ad.id
      flash[:notice] = "Successfuly created ad"
    end
    respond_with (@ad,:id => @ad.textbook.id)
  end
  
  def edit
    @ad = Ad.find(params[:id])
    respond_with(@ad)
  end
  
  def update
    @ad = Ad.find(params[:id])
    if @ad.update_attributes(params[:ad])
      flash[:notice] = "Successfully updated ad"
    end
    respond_with(@ad)
  end
  
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    flash[:notice] = "Successfuly deleted ad"
    respond_with(@ad)
    
  end
  
end
