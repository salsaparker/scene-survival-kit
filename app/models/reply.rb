class Reply < ActiveRecord::Base
  belongs_to :profile
  belongs_to :sender, class_name: "Profile", foreign_key: "message_sender_id"
  belongs_to :receiver, class_name: "Profile", foreign_key: "message_receiver_id"
  belongs_to :message

  # def receiver_id_switch
  #   @reply.message_receiver_id = @message.message_sender_id
  # end
end
