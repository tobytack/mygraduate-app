class FavoritesController < ApplicationController
  def create
    @user_id = current_user.id
    @favorite_id = Contact.find(params[:id]).id
    @favorite = Favorite.new(contact_id: @contact_id, user_id: @user_id)


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
end
