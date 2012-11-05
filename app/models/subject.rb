class Subject < ActiveRecord::Base
  attr_accessible :iit_major, :notes, :title
  has_and_belongs_to_many :databases
end
