
#this class has the following attributes: name, latitude, longitude, address, webaddress
class Park < ActiveRecord::Base
  has_and_belongs_to_many :people
  has_many :stories
  extend Geocoder::Model::ActiveRecord
 
  reverse_geocoded_by :latitude, :longitude

  def self.import_parks
    # names = []
 #    page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/places/campmaps/campmaps.asp"))
 #    x = page.css('li')[0].text
 #    x.each do |name|
 #      names << name
 #    end
 binding.pry
    page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/guides/contact.asp"))
    x = page.css('span.bodysmall_bold')
    parks = []
    x.each do |park|
      parks << park.text
    end
    parks.delete_if {|text| text == "More information"}
  
    binding.pry
    
    # addresses = []
 #    page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/guides/contact.asp"))
 #    x = page.css('span.bodysmall')[0].text
 #    y = page.css('span.bodysmall')[1].text
 #    z = x + y
 #    z.each do |address|
 #      addresses << address
 #    end
    #
    # park_map = []
    # page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/places/campmaps/campmaps.asp"))
    # x = page.css('ul.bodysmall a').map { |link| link['href'] }
    # x.each do |p|
    #   y = "http://outdoornebraska.ne.gov" + p
    #   park_map << y
    # end
    binding.pry
    for n in 0...names.length do
      Park.create(name: names[n], address: address[n])
    end
    binding.pry
  end 

end