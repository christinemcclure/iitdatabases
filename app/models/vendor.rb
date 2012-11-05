class Vendor < ActiveRecord::Base
  attr_accessible :name, :notes
  has_many :databases
end
