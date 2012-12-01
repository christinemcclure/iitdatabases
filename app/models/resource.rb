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
      #just select resources
      #where(['title LIKE ? OR alt_titles LIKE ? OR description LIKE ?', search_condition, search_condition, search_condition])

      #just select terms
      #joins(:terms).where('item LIKE ? OR acronym like ?', search_condition, search_condition)
      
      #select both
      find_by_sql ["SELECT resources.* FROM resources INNER JOIN resources_terms ON resources_terms.resource_id = resources.id INNER JOIN terms ON terms.id = resources_terms.term_id WHERE ((title LIKE ? OR alt_titles LIKE ? OR description LIKE ?) OR (item LIKE ? OR acronym like ?)) GROUP BY title ORDER BY title", search_condition, search_condition, search_condition, search_condition, search_condition]
      
    else
      find(:all)
    end
  end

end
