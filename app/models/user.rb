class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	has_many :snippets
	acts_as_voter

	has_attached_file :picture, styles: { original: "200x200#" }, 
	:path => ":rails_root/public/pictures/:id/:filename",
    :url => "/pictures/:id/:filename"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

	validates :name, presence: true, length: { in: 3..20, :message => "Must be 3-20 characters long" }
	validates :about, presence: false, length: { in: 5..500, :message => "Must be 5-500 characters long" }, :allow_blank => true
	validates :website, presence: false
	validates :github, presence: false
	validates_format_of :website, :with => /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix, :allow_blank => true
	validates_format_of :github, :with => /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix, :allow_blank => true
	validates :language, presence: false, length: { in: 3..20, :message => "Must be 3-20 characters long" }, :allow_blank => true
	validates_confirmation_of :password

	def increase_rep
    	update_attribute(:rep, rep + 1)
  	end

  	def decrease_rep
  		update_attribute(:rep, rep - 1)
	end
end
