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
      #WORKING without join
      where(['title LIKE ? OR alt_titles LIKE ? OR description LIKE ?', search_condition, search_condition, search_condition])

      #THIS JOIN WORKS, but how to join it with the previous?
      #joins(:terms).where('item LIKE ? OR acronym like ?', search_condition, search_condition)

      #this doesn't work because an AND is created with the join
      #where(['title LIKE ? OR alt_titles LIKE ? OR description LIKE ?', search_condition, search_condition, search_condition]).joins(:terms).where('item LIKE ? OR acronym like ?', search_condition, search_condition)

    else
      find(:all)
    end
  end

end
