class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
	has_many :admins, dependent: :destroy
	has_many :uhts, dependent: :destroy
	has_many :teams, :through => :uhts
	has_many :activities, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	
	acts_as_voter
end
