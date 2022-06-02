class User < ApplicationRecord
  has_one :apartments, dependent: :destroy
  has_many :filters, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :apartments, dependent: :destroy
  has_one :filter, dependent: :destroy
  has_many :statuses
end
