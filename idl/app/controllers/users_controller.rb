class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
  end

  def new
    @user = User.new
  end

  def admin
    @user = User.create(name: "Administrator", email: "admin@email.com", password: "x")
  end

  include SessionsHelper
  def create
      @user = User.create(user_params)
      s = Session.new(user_id: @user.id)
      s.save_with_session_code
      cookies.permanent[:session_code] = s.session_code
      redirect_to @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

   def edit
        @user = User.find(params[:id])
    end



    def update
        @user = User.find(params[:id])
        respond_to do |format|
            if @user.update(user_params)
                format.html {redirect_to @user, notice: 'User was successfully updated.'}
                format.json {head :no_content}
            else
                format.html {render action: 'edit'}
                format.json {render json: @user.errors, status: :unprocessable_entity}
            end
        end
    end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
  end
end
