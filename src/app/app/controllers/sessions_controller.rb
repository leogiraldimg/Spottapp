class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if user_signed_in?
  end

  def create
    user= User.find_by(email: params[:session][:email].downcase)
    user_nick= User.find_by(nickname: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to user_path(user)

    elsif user_nick && user_nick.authenticate(params[:session][:password])
      user = user_nick
      sign_in(user)
      redirect_to user_path(user)

    else  
      flash.now[:danger] = 'Email ou senha invalidos'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'Logout com sucesso'
    redirect_to entrar_path
  end

end
