class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(contact_id: params[:contact_id])
    redirect_to contacts_url, notice: "#{favorite.contact.user.name}さんの投稿をストックしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to contacts_url, notice: "#{favorite.contact.user.name}さんの投稿をストック解除しました"
  end

  def show
    @user = User.find(session[:user_id])
    @favorite_contacts = @user.favorite_contacts
  end
end

  def contact_params
    params.require(:contact).permit(:title,:content, :image, :image_cache)
  end
