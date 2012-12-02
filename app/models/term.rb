class Term < ActiveRecord::Base

  attr_accessible :iit_subject, :item, :acronym, :notes
#  has_and_belongs_to_many :resources, :class_name => "Term", :join_table => "resources", :association_foreign_key => ""
  has_and_belongs_to_many :resources
  validates :item, presence: true
  default_scope :order => 'terms.item'
  scope :all_iit_subjects, :conditions => {:iit_subject => true}, :order => 'term.item'

 def item=(val)
    write_attribute(:item, val.downcase)
 end

 def acronym=(val)
    write_attribute(:acronym, val.downcase)
 end

 def self.all_iit_subjects
   find_all_by_iit_subject(true)
 end

 def self.all_iit_non_subjects
   find_all_by_iit_subject(false)
 end

end
