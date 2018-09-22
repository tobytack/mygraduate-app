class ResponsesController < ApplicationController
  def create
    @contact = Contact.find(params[:contact_id])

    @response = @contact.responses.build(response_params)
    @responses = @contact.responses
    @response.user_id = current_user.id
    respond_to do |format|
      if @response.save
        format.js { render :index }
      else
        format.html { redirect_to contact_path(@contact), notice: '投稿に失敗しました' }
      end
    end
  end

private

  def response_params
    params.require(:response).permit(:contact_id, :content, :created_at, :user_id)
  end
end