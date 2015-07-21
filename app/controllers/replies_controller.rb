class RepliesController < ApplicationController

  def new 
    @reply = Reply.new
  end

  def create
    @reply = Reply.create(reply_params)
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
      @reply = Reply.find_by(:id params[:id])
    end

    def reply_params
      params.require(:reply).permit(:reply_body, :message_sender_id, :message_receiver_id)      
    end
end
