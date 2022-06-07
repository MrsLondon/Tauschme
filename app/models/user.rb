class User < ApplicationRecord
  has_one :apartments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :filter, dependent: :destroy

  def statuses
    Status.where("user1_id = ? OR user2_id = ?", id, id)
  end

  def matches
    statuses.where(matched: true)
  end

  def active_statuses
    filtered_statuses = statuses.where(is_ongoing: false)
    filtered_statuses.or(statuses.where(user1_id: id))
  end
end
