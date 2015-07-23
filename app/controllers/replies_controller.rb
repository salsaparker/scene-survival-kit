class RepliesController < ApplicationController
before_action :find_reply, only: [:destroy]
before_action :find_message, only: [:create, :find_last_reply]
before_action :find_last_reply, only: [:create]
  def new 
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.message_id = @message.id
    @reply.message_receiver_id = @message.message_sender_id
    @reply.message_sender_id = current_user.profile.id    

    if @last_reply.present?
        @last_reply.message_receiver_id = (@last_reply.message_receiver_id == current_user.profile.id) ? @last_reply.message_sender_id : current_user.profile.id
    end

    if @reply.save
      flash[:success]= "Message sent!"
      redirect_to messages_path
    else
      flash[:error]= "Something went wrong!"
      render :new
    end
  end

  def destroy
    @reply.destroy
  end

  private
    def find_reply
      @reply = Reply.find_by(id: params[:id])
    end

    def reply_params
      params.require(:reply).permit(:reply_body, :message_receiver_id, :message_id)      
    end

    def find_message
      @message = Message.find(params[:reply][:message_id])
    end

    def find_last_reply
      binding.pry
      @last_reply = @message.replies.last
    end
end
