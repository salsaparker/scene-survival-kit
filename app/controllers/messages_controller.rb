class MessagesController < ApplicationController

  def inbox
    @inbox = Message.find_by(id: params[:id])
  end

  def sent
    @sent = Message.find_by(id: params[:sender_id])  
  end

  def show
    @message.replies
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
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
