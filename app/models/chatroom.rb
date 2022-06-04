class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :status

  def name_for_user(current_user)
    other_user_id = [status.user1_id, status.user2_id].find { |user_id| user_id != current_user.id }
    Apartment.find_by(user_id: other_user_id).title
  end
end
