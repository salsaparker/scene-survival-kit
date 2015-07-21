class MessagesController < ApplicationController
before_action :find_message, only: [:show, :destroy]
  def index
    @messages = Message.find(:profile_id)
  end

  def sent
    @sent_messages = Message.find_by(id: params[:sender_id])  
  end

  def show
    @replies = @message.replies
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.message_sender_id = current_user.profile.id
    if @message.save
      flash[:success]= "Message sent!"
      redirect_to messages_path
    else
      flash[:error]= "Something went wrong!"
      render :new
    end
  end

  def destroy
    @message.destroy
  end

  private
    def find_message
      @message = Message.find_by(id: params[:id])
    end

    def message_params
      params.require(:message).permit(:subject, :message_body, :message_sender_id, :message_receiver_id)
    end
end
