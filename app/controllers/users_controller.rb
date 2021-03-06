class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
    before_filter :require_user, :only => [:index, :show, :edit, :update]
    layout 'default'
    def index
      @user = User.find_by_id(current_user.id)
      
      @bookmarks = @user.bookmarks(:include => :ad, :include => :textbook)
      @ads = @user.ads(:include=> :textbook)
    end
    
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "Account registered!"
        redirect_back_or_default users_url
      else
        render :action => :new
      end
    end

    def show
      @user = @current_user
    end

    def edit
      @user = @current_user
    end

    def update
      @user = @current_user # makes our views "cleaner" and more consistent
      if @user.update_attributes(params[:user])
        flash[:notice] = "Account updated!"
        redirect_to users_url
      else
        render :action => :edit
      end
    end
end
