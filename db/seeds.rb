# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#vendor = Vendor.new(:name => "EBSCO")
#databases = vendor.databases.create([
#  { :title => "Academic Search Premier",
#    :alt_titles => "ASP",
#    :description => "Considered the world's largest multi-discipline full-text database of scholarly knowledge, this database is a good place to start searching for information on almost any topic. Covering all areas of academic study, this database contains indexing and abstracting for more than 8,200 magazines and journals, of which more than 3,600 are full-text peer-reviewed publications.",
#    :restricted => true,
#    :active => true,
#    :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=aph",
#    :popular => true
#  }
#])

Resource.delete_all
Term.delete_all

terms = Term.create ([
  {:item => "airforce aerospace studies",:acronym => "AS",:iit_subject => true},
  {:item => "archiecture",:acronym => "arch",:iit_subject => true},
  {:item => "Architecture and Urbanism",:acronym => "aurb",:iit_subject => true},
  {:item => "art and architectural history",:acronym => "aah",:iit_subject => true},
  {:item => "biology",:acronym => "biol",:iit_subject => true},
  {:item => "Biomedical Engineering",:acronym => "bme",:iit_subject => true},
  {:item => "business",:acronym => "bus",:iit_subject => true},
  {:item => "chemical engineering",:acronym => "che",:iit_subject => true},
  {:item => "chemistry",:acronym => "chem",:iit_subject => true},
  {:item => "Civil and Architectural Engineering",:acronym => "cae",:iit_subject => true},
  {:item => "Communications",:acronym => "com",:iit_subject => true},
  {:item => "Computer Science",:acronym => "cs",:iit_subject => true},
  {:item => "Cooperative Education",:acronym => "coop",:iit_subject => true},
  {:item => "Economics",:acronym => "econ",:iit_subject => true},
  {:item => "Electrical and Computer Engineering",:acronym => "ece",:iit_subject => true},
  {:item => "Engineering Graphics",:acronym => "eg",:iit_subject => true},
  {:item => "english",:acronym => "eng",:iit_subject => true},
  {:item => "Environmental Engineering",:acronym => "enve",:iit_subject => true},
  {:item => "Environmental Management and Sustainability",:acronym => "ems",:iit_subject => true},
  {:item => "Food Process Engineering",:acronym => "fpe",:iit_subject => true},
  {:item => "Food Safety and Technology",:acronym => "fst",:iit_subject => true},
  {:item => "Graduate Continuation Studies",:acronym => "gcs",:iit_subject => true},
  {:item => "Industrial Technology and Management",:acronym => "intm",:iit_subject => true},
  {:item => "Institute of Design",:acronym => "id",:iit_subject => true},
  {:item => "humanities",:acronym => "hum",:iit_subject => true},
  {:item => "information technology and management",:acronym => "itm",:iit_subject => true},
  {:item => "political science",:acronym => "ps",:iit_subject => true},
  {:item => "Mathematics",:acronym => "math",:iit_subject => true},
  {:item => "Military Science",:acronym => "mils",:iit_subject => true},
  {:item => "Naval Science",:acronym => "ns",:iit_subject => true},
  {:item => "physics",:acronym => "phys",:iit_subject => true},
  {:item => "Psychology",:acronym => "psyc",:iit_subject => true},
  {:item => "sociology",:acronym => "soc",:iit_subject => true},
  {:item => "general",:acronym => "",:iit_subject => false}
])

resource = Resource.create({
  :title => "Academic Search Premier",
  :alt_titles => "ASP",
  :owner => "EBSCO",
  :description => "Considered the world's largest multi-discipline full-text database of scholarly knowledge, this database is a good place to start searching for information on almost any topic. Covering all areas of academic study, this database contains indexing and abstracting for more than 8,200 magazines and journals, of which more than 3,600 are full-text peer-reviewed publications.",
  :restricted => true,
  :active => true,
  :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=aph",
  :popular => true
})
terms = ["general","political science","humanities","psychology","english","communications","business"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "ACM Digital Library",
  :alt_titles => "Association for Computing Machinery",
  :owner => "ACM Portal",
  :description => "The Association for Computing Machinery Digital Library is an online repository of papers from publications that have been published, co-published, or co-marketed by the ACM, including journals, newsletters, and conference proceedings. All computing subject areas are covered.",
  :restricted => true,
  :active => true,
  :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=aph",
  :popular => true
})
terms = ["computer science","communications"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "Business Source Premier",
  :alt_titles => "BSP",
  :owner => "EBSCO",
  :description => "Business Source Premier, is the industry's most used business research database, providing full text for more than 2,300 journals, including full text for more than 1,100 peer-reviewed business publications. Full text coverage in all disciplines of business, including marketing, management, MIS, POM, accounting, finance and economics. Business Source Premier contains full text from the world's top management and marketing journals. The database also includes other sources of full text information such as country economic reports from the EIU, Global Insight, ICON Group and CountryWatch and detailed company profiles for the world's 10,000 largest companies. Additional full text, non-journal content includes market research reports, industry reports, country reports, company profiles and SWOT analyses.",
  :restricted => true,
  :active => true,
  :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=aph",
  :popular => true
})
terms = ["general","political science","humanities","psychology","english","communications","business"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource.save
