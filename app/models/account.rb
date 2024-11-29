class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_secure_password
  has_many :playlists, dependent: :destroy
  validates :first_name, :last_name, :username, presence: true, uniqueness: true
  validates :num_of_songs_you_want, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :ensure_authentication_token
  
end
