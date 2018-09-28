class FavoritesController < ApplicationController

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
  #def index
    #@user = current_user
    #@favorites = Favorite.where(user_id: @user.id).all
  #end

  def show_favorites
    @contact = Contact.find(params[:id])
    @favorites = Favorite.find_by(contact_id: @contact.id)
  end
  
  private

  def contact_params
    params.require(:contact).permit(:title,:content, :image, :image_cache)
  end
end

  def login_check
    unless current_user
      render new_session_path
    end
  end
