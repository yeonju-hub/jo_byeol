class Team < ApplicationRecord
	has_one :admin
	has_many :uhts,  dependent: :destroy
	has_many :users, :through => :uhts
	has_many :meetings, dependent: :destroy
	has_many :activities, dependent: :destroy
	has_many :posts, dependent: :destroy
end
