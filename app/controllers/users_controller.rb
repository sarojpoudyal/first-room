class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if !logged_in? &&   require_same_user
      redirect_to root_path
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :mobile, :password)
  end

  def require_same_user
  if current_user !=@user_id and !current_user.admin?
    redirect_to root_path
  end
end

end
