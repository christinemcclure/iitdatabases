class Resource < ActiveRecord::Base
  attr_accessible :access_url, :active, :alt_titles, :owner, :description, :notes, :popular, :restricted, :title, :terms_attributes
  has_and_belongs_to_many :terms
  accepts_nested_attributes_for :terms, :allow_destroy => true
  validates :title, presence: true
  default_scope :order => 'resources.title'
  def self.url_prefix
    'http://ezproxy.gl.iit.edu/login?url='
  end
end
