class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to contacts_path(@user.id), notice: "アカウントを作成しました"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    #追加
    @favorites = Favorite.where("user_id = ?", @user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :icon_cache)
  end
end