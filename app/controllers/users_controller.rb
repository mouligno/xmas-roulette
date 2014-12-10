class UsersController < ApplicationController
  expose(:user, attributes: :user_params)
  expose(:users) { User.order(:first_name) }

  def index
  end

  def show
  end

  def create
    if user.save
      redirect_to new_user_path()
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to(user)
    else
      render :edit
    end
  end

  def destroy
    user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end

