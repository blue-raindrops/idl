class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      s = Session.new(user_id: user.id)
      s.save_with_session_code
      cookies.permanent[:session_code] = s.session_code
      redirect_to root_url
    else 
      render text: 'Incorrect email or password.'
    end
  end

  def destroy
    #session[:current_user] = nil
    #flash[:notice] = "You have successfully logged out."
    cookies.delete :session_code
    #session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
end
