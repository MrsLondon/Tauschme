class Status < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User', optional: true

  validates :user1_id, uniqueness: { scope: :user2_id }

  # def liked?
  #   user1 == current_user || user2 == current_user
  # end

end
