class Snippet < ActiveRecord::Base
	acts_as_votable
	belongs_to :category
	belongs_to :user
	has_many :comments

	validates :category_id, presence: true
	validates :title, presence: true, length: { in: 5..35, :message => "Must be 5-35 characters long" }

	validate :any_present?

	def any_present?
  		if html.blank? and css.blank? and javascript.blank? and ruby.blank? and python.blank?
    		errors.add(:title, "You must include at least one languages code")
  		end
	end

    # Home page
    scope :random, -> { order("RANDOM()").limit(1) }
    scope :upvotedSnippet, -> { order(:cached_votes_up => :desc).limit(1) }
	scope :totalVotes, -> { sum(:cached_votes_total) }
	scope :totalUpVotes, -> { sum(:cached_votes_up) }
	scope :totalDownVotes, -> { sum(:cached_votes_down) }

	# Created at descending order by time
	scope :desc, -> { order("created_at DESC") }

	def self.search(search)
    	where("title LIKE ? OR css LIKE ? OR html LIKE ? OR javascript LIKE ? OR ruby LIKE ? OR python LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
    
end
