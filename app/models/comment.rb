class Comment < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	belongs_to :snippet

	validates :body, presence: true, length: { in: 5..1500, :message => "Must be 5-1500 characters long" }

end
