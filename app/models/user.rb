class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :posts

    validates :username, presence: true, uniqueness: true, length: { in: 2..12 }
    validates :email, presence: true
    validates :password presence: true, length: { in: 2..12 }
end
