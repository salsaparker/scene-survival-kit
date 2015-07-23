class MessagesController < ApplicationController
before_action :find_message, only: [:show, :destroy]
  
  def index
    profile_id = current_user.profile.id
    @messages = Message.my_messages(profile_id)
    @unread = @messages.where(reply_read: false)
    @read = @messages.where(reply_read: true)
    @sent_messages = Message.sent_messages(profile_id)
    # raise "the roof"
  end

  def show
    @message.reply_read = true
    @message.save
    @message.reload
    @replies = @message.replies
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.message_sender_id = current_user.profile.id
    binding.pry
    if @message.save
      binding.pry
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
      params.require(:message).permit(:subject, :message_body, :message_receiver_id)
    end
end
