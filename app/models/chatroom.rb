class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :status

  def name_for_user(current_user)
    apartment_for_user(current_user).title
  end

  def thumbnail_for_user(current_user)
    apartment_for_user(current_user).photos.first.key
  end

  private

  def apartment_for_user(current_user)
    return @apartment if @apartment.present?
    other_user_id = [status.user1_id, status.user2_id].find { |user_id| user_id != current_user.id }
    @apartment = Apartment.find_by(user_id: other_user_id)
  end
end
