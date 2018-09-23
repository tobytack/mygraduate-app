class ContactsController < ApplicationController
  before_action :set_contact, only:[:show, :edit, :update, :destroy]
  before_action :login_check, only: [:index, :new, :edit, :show, :destroy]

  def index
    @contacts = Contact.all
  end

  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      #ContactMailer.contact_mail(@contact).deliver
      redirect_to contacts_path, notice: "問い合わせ中･･･"
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @favorite = current_user.favorites.find_by(contact_id: @contact.id)
    @responses = @contact.responses.includes(:user).all
    @response = @contact.responses.build(user_id: current_user.id) if current_user
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "投稿内容を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: "投稿を削除しました"
  end

  def confirm
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    render :new if @contact.invalid?
  end


  private

  def contact_params
    params.require(:contact).permit(:title,:content, :image, :image_cache)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def login_check
    unless current_user
      render new_session_path
    end
  end
end