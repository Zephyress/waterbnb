class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo, dependent: :destroy
  has_many :boats
  has_many :bookings

  def profile_picture
    if photo.attached?
      photo.key
    else
      "logo.png"
    end
  end
end
