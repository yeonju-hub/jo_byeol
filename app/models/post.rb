class Post < ApplicationRecord
  belongs_to :user
  belongs_to :team
	
	has_many :comments, dependent: :destroy
	
	acts_as_votable
end
