class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入りに登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入りに解除しました"
  end

  def show
    @user = User.find(session[:user_id])
    @favorite_blogs = @user.favorite_blogs
  end
end