class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Seja bem vind! #{@user.username}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Sua conta foi alterada"
      redirect_to @user
    else
      render 'eidt'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end