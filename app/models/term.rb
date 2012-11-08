class Term < ActiveRecord::Base
  attr_accessible :iit_subject, :item, :acronym, :notes
  has_and_belongs_to_many :resources
  validates :item, presence: true
  default_scope :order => 'terms.item'
end
