class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logado com sucesso"
      redirect_to user
    else
      flash.now[:alert] = "Algo está errado" # in the case to redirect flash persist one http request, render is not a request so we use flash.now
      render 'new' 
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Deslogou"
    redirect_to root_path
  end

end