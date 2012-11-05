# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
vendor = Vendor.new(:name => "EBSCO")
databases = vendor.databases.create([
  { :title => "Academic Search Premier",
    :alt_titles => "ASP",
    :description => "Considered the world's largest multi-discipline full-text database of scholarly knowledge, this database is a good place to start searching for information on almost any topic. Covering all areas of academic study, this database contains indexing and abstracting for more than 8,200 magazines and journals, of which more than 3,600 are full-text peer-reviewed publications.",
    :restricted => true,
    :active => true,
    :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=aph",
    :popular => true
  }
])
