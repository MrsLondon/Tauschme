class Apartment < ApplicationRecord
  belongs_to :user
  has_many_attached :photos, dependent: :destroy
  validates :title, presence: true
  validates :rent, numericality: { only_integer: true }, presence: true
  validates :room, numericality: { only_integer: true }, presence: true
  validates :area, presence: true

end
