class Status < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User', optional: true
  has_one :chatroom, dependent: :destroy

  validates :user1_id, uniqueness: { scope: :user2_id }

  after_save :create_chatroom

  def create_chatroom
    if matched? && chatroom.nil?
      Chatroom.create(status_id: id)
    end
  end

end
