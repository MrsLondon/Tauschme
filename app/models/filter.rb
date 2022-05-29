class Filter < ApplicationRecord
  belongs_to :user
  validates :rent, numericality: { only_integer: true }, presence: true
  validates :room, numericality: { only_integer: true }, presence: true
  validates :area, presence: true
end
