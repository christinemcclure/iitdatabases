class Database < ActiveRecord::Base
  attr_accessible :access_url, :active, :alt_titles, :description, :notes, :popular, :restricted, :string, :title, :vendor_id
  has_one :vendor
  has_and_belongs_to_many :subjects
end
