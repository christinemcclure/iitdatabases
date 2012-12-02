class Resource < ActiveRecord::Base
  attr_accessible :access_url, :active, :alt_titles, :owner, :description, :notes, :popular, :restricted, :title, :terms_attributes, :term_ids
  has_and_belongs_to_many :terms
  accepts_nested_attributes_for :terms, :allow_destroy => true
  validates :title, presence: true
  default_scope :order => 'resources.title'
  scope :popular_resources, :conditions => {:popular => true}, :order => 'resources.title'
  scope :all_active, :conditions => {:active => true}, :order => 'resources.title'

  def self.url_prefix
    'http://ezproxy.gl.iit.edu/login?url='
  end

  def self.search(search)
      search_condition = "%" + search + "%"
      find_by_sql ["SELECT resources.* FROM resources INNER JOIN resources_terms ON resources_terms.resource_id = resources.id INNER JOIN terms ON terms.id = resources_terms.term_id WHERE ((title LIKE ? OR alt_titles LIKE ? OR description LIKE ?) OR (item LIKE ? OR acronym like ?)) GROUP BY title ORDER BY title", search_condition, search_condition, search_condition, search_condition, search_condition]
  end

  def self.subject_search(subject_search)
      search_condition = "%" + subject_search + "%"
      joins(:terms).where('item LIKE ? OR acronym like ?', search_condition, search_condition).group(:title)
  end

end
