
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
 
    page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/guides/contact.asp"))
    x = page.css('span.bodysmall_bold')
    parks = []
    x.each do |park|
      parks << park.text
    end
    
    parks.delete_if {|text| text == "More information"}
    z = []
    while parks.length >0 
      z << parks.pop(2)
    end
    
    park_names = []
    z.each do |p|
      park_names << p.join(' ')
    end
    
    final_park_names = []
    park_names.each do |p|
      final_park_names << p.gsub(/\r\n/, '')
    end
    
    page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/guides/contact.asp"))
    x = page.css('span.bodysmall')
    parks = []
    x.each do |park|
      parks << park.text
    end
    
    parks.delete_if {|text| text =~ (/\(\d\d\d\)\s?\d\d\d-\d\d\d\d/)}
    parks.delete_if {|text| text =~ (/@/)} 
    z = []
    while parks.length >0
      z << parks.pop(2)
    end
    
    park_addresses = []
    z.each do |p|
      park_addresses << p.join(' ')
    end
    
    final_park_addresses = []
    park_addresses.each do |p|
      final_park_addresses << p
    end
    
    binding.pry
    for n in 0...names.length do
      Park.create(name: final_park_names[n], address: final_park_addresses[n])
    end
    binding.pry
  end 

end



# park_map = []
# page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/places/campmaps/campmaps.asp"))
# x = page.css('ul.bodysmall a').map { |link| link['href'] }
# x.each do |p|
#   y = "http://outdoornebraska.ne.gov" + p
#   park_map << y
# end