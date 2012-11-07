class Resource < ActiveRecord::Base
  attr_accessible :access_url, :active, :alt_titles, :description, :notes, :popular, :restricted, :title
end
