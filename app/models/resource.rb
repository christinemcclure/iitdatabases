class Resource < ActiveRecord::Base
  attr_accessible :access_url, :active, :alt_titles, :owner, :description, :notes, :popular, :restricted, :title, :terms_attributes, :term_ids
  has_and_belongs_to_many :terms
  accepts_nested_attributes_for :terms, :allow_destroy => true
  validates :title, presence: true
  default_scope :order => 'resources.title'

  def self.url_prefix
    'http://ezproxy.gl.iit.edu/login?url='
  end

  def self.search(search)
    if search
      search_condition = "%" + search + "%"
      find(:all, :conditions => ['title LIKE ? OR alt_titles LIKE ? OR description LIKE ? OR notes LIKE ?', search_condition, search_condition, search_condition, search_condition])
      
      #joins(:terms).where('item LIKE ?', search_condition)
    else
      find(:all)
    end
  end

end
