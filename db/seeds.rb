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
  {:item => "anthropology",:acronym => "anth",:iit_subject => true},
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
  {:item => "computer science professional masters",:acronym => "csp",:iit_subject => true},
  {:item => "Computer Science",:acronym => "cs",:iit_subject => true},
  {:item => "Cooperative Education",:acronym => "coop",:iit_subject => true},
  {:item => "Economics",:acronym => "econ",:iit_subject => true},
  {:item => "Electrical and Computer Engineering",:acronym => "ece",:iit_subject => true},
  {:item => "Engineering Graphics",:acronym => "eg",:iit_subject => true},
  {:item => "engineering management",:acronym => "em",:iit_subject => true},
  {:item => "english",:acronym => "eng",:iit_subject => true},
  {:item => "Environmental Engineering",:acronym => "enve",:iit_subject => true},
  {:item => "Environmental Management and Sustainability",:acronym => "ems",:iit_subject => true},
  {:item => "exchange student",:acronym => "ex",:iit_subject => false},
  {:item => "Food Process Engineering",:acronym => "fpe",:iit_subject => true},
  {:item => "Food Safety and Technology",:acronym => "fst",:iit_subject => true},
  {:item => "general engineering",:acronym => "egr",:iit_subject => false},
  {:item => "general",:acronym => "",:iit_subject => false},
  {:item => "Graduate Continuation Studies",:acronym => "gcs",:iit_subject => false},
  {:item => "history",:acronym => "hist",:iit_subject => true},
  {:item => "humanities",:acronym => "hum",:iit_subject => true},
  {:item => "Industrial Technology and Management",:acronym => "intm",:iit_subject => true},
  {:item => "information technology and management",:acronym => "itm",:iit_subject => true},
  {:item => "Institute of Design",:acronym => "id",:iit_subject => true},
  {:item => "intellectual property management and markets",:acronym => "IPMM",:iit_subject => true},
  {:item => "internship",:acronym => "",:iit_subject => false},
  {:item => "interprofessional project",:acronym => "ipro",:iit_subject => true},
  {:item => "itcp security",:acronym => "",:iit_subject => true},
  {:item => "landscape architecture",:acronym => "",:iit_subject => true},
  {:item => "literature",:acronym => "lit",:iit_subject => true},
  {:item => "management science",:acronym => "",:iit_subject => true},
  {:item => "marketing analytics and communications",:acronym => "",:iit_subject => true},
  {:item => "master of science in finance",:acronym => "",:iit_subject => true},
  {:item => "materials science",:acronym => "",:iit_subject => true},
  {:item => "mathematics and science education",:acronym => "",:iit_subject => true},
  {:item => "Mathematics",:acronym => "math",:iit_subject => true},
  {:item => "mba business",:acronym => "mba",:iit_subject => true},
  {:item => "mechanical, materials and aerospace engineering",:acronym => "mmae",:iit_subject => true},
  {:item => "military science",:acronym => "ms",:iit_subject => true},
  {:item => "Military Science",:acronym => "mils",:iit_subject => true},
  {:item => "naval science",:acronym => "ns",:iit_subject => true},
  {:item => "philosophy",:acronym => "phil",:iit_subject => true},
  {:item => "physics",:acronym => "phys",:iit_subject => true},
  {:item => "political science",:acronym => "ps",:iit_subject => true},
  {:item => "pro learning online",:acronym => "",:iit_subject => false}, 
  {:item => "professional communication advancement",:acronym => "",:iit_subject => true},
  {:item => "professional learning",:acronym => "",:iit_subject => true},  
  {:item => "proficiency of english as a second language",:acronym => "",:iit_subject => true},
  {:item => "pschology",:acronym => "psyc",:iit_subject => true},
  {:item => "public administration",:acronym => "pa",:iit_subject => true},
  {:item => "shimer college",:acronym => "",:iit_subject => false},
  {:item => "sociology",:acronym => "soc",:iit_subject => true},
  {:item => "technology",:acronym => "",:iit_subject => false},
  {:item => "undergraduate continuing studies",:acronym => "",:iit_subject => false}
])

resource = Resource.create({
  :title => "Academic Search Premier",
  :alt_titles => "ASP",
  :owner => "EBSCOhost",
  :description => "One of the largest full-text databases of scholarly information. A good place to start searching for journal articles on almost any topic.",
  :restricted => true,
  :active => true,
  :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=aph",
  :popular => true
})
terms = ["general","literature","political science","humanities","psychology","english","communications","business"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "ACM Digital Library",
  :alt_titles => "Association for Computing Machinery",
  :owner => "ACM Portal",
  :description => "Online repository of papers and publications from the ACM, covering all aspects of computing.",
  :restricted => true,
  :active => true,
  :access_url => "http://portal.acm.org/dl.cfm",
  :popular => true
})
terms = ["computer science","communications"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "Business Source Premier",
  :alt_titles => "BSP",
  :owner => "EBSCOhost",
  :description => "This database covers all disciplines of business, including marketing, management, MIS, POM, accounting, finance and economics.",
  :restricted => true,
  :active => true,
  :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=buh",
  :popular => true
})
terms = ["general","political science","humanities","psychology","english","communications","business"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "Avery Index to Architectural Periodicals",
  :alt_titles => "",
  :owner => "EBSCOhost",
  :description => "Comprehensive database of literature on architecture and design.",
  :restricted => true,
  :active => true,
  :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=bvh",
  :popular => false
})
terms = ["archiecture","architecture and urbanism"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "Books 24x7",
  :alt_titles => "Books Twenty-four by seven",
  :owner => "Books 24x7",
  :description => "E-books covering computer science and information technology.",
  :restricted => true,
  :active => true,
  :access_url => "http://library.books24x7.com/library.asp?^B",
  :popular => true
})
terms = ["computer science","technology", "Engineering Graphics", "information technology and management", "communications"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "Dissertations and Theses",
  :alt_titles => "",
  :owner => "Proquest",
  :description => "http://search.proquest.com/pqdtft.",
  :restricted => true,
  :active => true,
  :access_url => "Online database of doctoral dissertations.",
  :popular => false
})
terms = ["general", "Graduate Continuation Studies", "undergraduate continuing studies"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "ERIC",
  :alt_titles => "Education Resources Information Center",
  :owner => "EBSCOhost",
  :description => "Comprehensive database of information and literature on all aspects of education.",
  :restricted => true,
  :active => true,
  :access_url => "http://search.EBSCOhost.com/login.asp?profile=web&defaultdb=eric",
  :popular => true
})
terms = ["Cooperative Education", "mathematics and science education"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "Google Scholar",
  :alt_titles => "",
  :owner => "Google",
  :description => "mathematics and science education",
  :restricted => true,
  :active => true,
  :access_url => "mathematics and science education",
  :popular => false
})
terms = ["general", "history"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "IEEE Xplore",
  :alt_titles => "Institute of Electrical and Electronics Engineers",
  :owner => "Institute of Electrical and Electronics Engineers",
  :description => "Access the full text of publications from the IEEE and the IEE.",
  :restricted => true,
  :active => true,
  :access_url => "http://ieeexplore.ieee.org/",
  :popular => true
})
terms = ["Civil and Architectural Engineering", "Electrical and Computer Engineering", "engineering management", "Environmental Engineering", "general engineering", "mechanical, materials and aerospace engineering"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "Inspec",
  :alt_titles => "",
  :owner => "EBSCOhost",
  :description => "Comprehensive database covering all aspects of science, engineering, and technology.",
  :restricted => true,
  :active => true,
  :access_url => "http://apps.webofknowledge.com/INSPEC_GeneralSearch_input.do?product=INSPEC&search_mode=GeneralSearch",
  :popular => false
})
terms = ["technology", "computer science", "communications", "Civil and Architectural Engineering", "Electrical and Computer Engineering", "engineering management", "Environmental Engineering", "general engineering", "mechanical, materials and aerospace engineering"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

resource = Resource.create({
  :title => "JSTOR",
  :alt_titles => "",
  :owner => "JSTOR",
  :description => "Archive of essential scholarly journals related to the humanities, physical sciences, and social sciences.",
  :restricted => true,
  :active => true,
  :access_url => "http://www.jstor.org",
  :popular => true
})
terms = ["english", "literature", "communications"]
terms.each do |s|
  resource.terms << Term.find_or_create_by_item(s)
end

#resource = Resource.create({
#  :title => "",
#  :alt_titles => "",
#  :owner => "",
#  :description => "",
#  :restricted => true,
#  :active => true,
#  :access_url => "",
#  :popular => false
#})
#terms = ["", ""]
#terms.each do |s|
#  resource.terms << Term.find_or_create_by_item(s)
#end



resource.save

