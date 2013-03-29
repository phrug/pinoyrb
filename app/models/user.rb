class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :speakers, :inverse_of => :user
  has_many :presentations, :through => :speakers
  has_many :affiliations, :inverse_of => :user
  has_many :entities, :through => :affiliations
  has_many :contributors, :as => :contributable, :inverse_of => :contributable
  has_many :projects, :through => :contributors
  has_many :links, :as => :linkable, :inverse_of => :linkable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :blurb, :about_me
  # attr_accessible :title, :body

  attr_accessible :links_attributes, :allow_destroy => true
  accepts_nested_attributes_for :links, :allow_destroy => true
  attr_accessible :link_ids

end
