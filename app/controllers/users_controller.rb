class UsersController < ApplicationController
  def new
  	 @user = User.new
  end

  def index
    @user = User.find(session[:user_id])
    @users = User.all
  end
  def show
    @user = User.find(session[:user_id])
    @user = User.find(params[:id])
    @answers = Answer.find(:all, :conditions => {:user_id => params[:id]})
  end

  def create
     @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
end
