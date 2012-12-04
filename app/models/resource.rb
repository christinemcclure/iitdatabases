class Resource < ActiveRecord::Base
  attr_accessible :access_url, :active, :alt_titles, :owner, :description, :notes, :popular, :restricted, :title, :terms_attributes, :term_ids
  has_and_belongs_to_many :terms
  accepts_nested_attributes_for :terms, :allow_destroy => true
  validates :title, presence: true
  default_scope :order => 'resources.title'
  scope :popular_resources, :conditions => {:popular => true}, :order => 'lower(resources.title)'
  scope :all_active, :conditions => {:active => true}, :order => 'upper(resources.title)'

  def self.url_prefix
    'http://ezproxy.gl.iit.edu/login?url='
  end

  def self.search(search)
    search_condition = "%" + search + "%"
    #find_by_sql ["SELECT resources.* FROM resources INNER JOIN resources_terms ON resources_terms.resource_id = resources.id INNER JOIN terms ON terms.id = resources_terms.term_id WHERE ((title LIKE ? OR alt_titles LIKE ? OR description LIKE ?) OR (item LIKE ? OR acronym like ?)) GROUP BY title ORDER BY title", search_condition, search_condition, search_condition, search_condition, search_condition]
    #this works on Heroku
    find_by_sql ['SELECT DISTINCT ON (resources.title) resources.* FROM resources INNER JOIN resources_terms ON resources_terms.resource_id = resources.id INNER JOIN terms ON terms.id = resources_terms.term_id WHERE ((lower(description) LIKE lower(?)) OR (lower(title) LIKE lower(?)) OR (lower(alt_titles) LIKE lower(?)) OR (lower(item) LIKE lower(?)) OR (lower(acronym) LIKE lower(?)))', search_condition, search_condition, search_condition, search_condition, search_condition]
  end

  def self.subject_search(subject_search)
    #search_condition = "%" + subject_search + "%"
    #find_by_sql ["SELECT resources.* FROM resources INNER JOIN resources_terms ON resources_terms.resource_id = resources.id INNER JOIN terms ON terms.id = resources_terms.term_id WHERE (term_id = ?) GROUP BY title ORDER BY title", subject_search]
    # must use sql to get record count
    joins(:terms).where('term_id = ?', subject_search).group(:title)
  end

end
