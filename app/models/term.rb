class Term < ActiveRecord::Base
  attr_accessible :iit_subject, :item, :acronym, :notes
#  has_and_belongs_to_many :resources, :class_name => "Term", :join_table => "resources", :association_foreign_key => ""
  has_and_belongs_to_many :resources
  validates :item, presence: true
  default_scope :order => 'terms.item'

 def item=(val)
    write_attribute(:item, val.downcase)
 end

 def acronym=(val)
    write_attribute(:acronym, val.downcase)
 end
end
