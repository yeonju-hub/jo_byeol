class Team < ApplicationRecord
	has_one :admin,  dependent: :destroy
	has_many :uhts,  dependent: :destroy
	has_many :users, :through => :uhts
	has_many :meetings, dependent: :destroy
	has_many :activities, dependent: :destroy
end
