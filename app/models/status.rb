class Status < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'

  # def liked?
  #   user1 == current_user || user2 == current_user
  # end

end
