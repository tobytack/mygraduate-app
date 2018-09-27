class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token ,:only => [:create]
  
  def create
    favorite = current_user.favorites.create(contact_id: params[:contact_id])
    redirect_to contacts_url, notice: "#{favorite.contact.user.name}さんの投稿をお気に入りしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to contacts_url, notice: "#{favorite.contact.user.name}さんの投稿をお気に入り解除しました"
  end

  def show
    @user = User.find(session[:user_id])
    @favorite_contacts = @user.favorite_contacts
  end
  

  #追加
  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end

  def show_favorites
    @contacts = Contact.find(params[:id])
    @favorites = Favorite.where(contact_id: @contact.id).all
  end
  private

  def contact_params
    params.require(:contact).permit(:title,:content, :image, :image_cache)
  end
end