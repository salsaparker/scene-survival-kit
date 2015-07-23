class Message < ActiveRecord::Base
  belongs_to :profile
  belongs_to :sender, class_name: "Profile", foreign_key: "message_sender_id"
  belongs_to :receiver, class_name: "Profile", foreign_key: "message_receiver_id"
  has_many :replies, dependent: :destroy

  def self.my_messages(profile_id)
    # raise ""
    where(message_receiver_id: profile_id)
  end

  def self.sent_messages(profile_id)
    where(message_sender_id: profile_id)
  end

  def self.last_message(message_id)
    
  end
end
