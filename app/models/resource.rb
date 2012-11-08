class Resource < ActiveRecord::Base
  attr_accessible :access_url, :active, :alt_titles, :owner, :description, :notes, :popular, :restricted, :title
  has_and_belongs_to_many :terms
end
