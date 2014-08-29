
#this class has the following attributes: name, latitude, longitude, address, webaddress
class Park < ActiveRecord::Base
  has_and_belongs_to_many :people
  has_many :stories
  extend Geocoder::Model::ActiveRecord
 
  reverse_geocoded_by :latitude, :longitude

  def self.import_parks
  
    page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/guides/contact.asp"))
    park_sections = page.css("table[width='570'] tr").each_slice(5)
    park_sections.each do |p|
      first_name = p[0].css('span.bodysmall_bold').text
      last_name = p[1].css('span.bodysmall_bold').text
      street_address = p[0].css('span.bodysmall').text
      city = p[1].css('span.bodysmall').text
      
      last_name.gsub!(/\r\n/, '')
      binding.pry
    
      Park.create(name: "#{first_name} #{last_name}", address: "#{street_address} #{city}")
      binding.pry
    end    
    
    
    
    
    
    
    # x = page.css('span.bodysmall_bold')
    # parks = []
    # x.each do |park|
    #   parks << park.text
    # end
    #
    # parks.delete_if {|text| text == "More information"}
    # z = []
    # while parks.length >0
    #   z << parks.pop(2)
    # end
    #
    # park_names = []
    # z.each do |p|
    #   park_names << p.join(' ')
    # end
    #
    # final_park_names = []
    # park_names.each do |p|
    #   final_park_names << p.gsub(/\r\n/, '')
    # end
    
    # page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/guides/contact.asp"))
    # x = page.css('span.bodysmall')
  #   parks = []
  #   x.each do |park|
  #     parks << park.text
  #   end
  #
  #   parks.keep_if {|text| text =~ (/[NE]\d\d\d\d\d.\d\d\d\d/)}
  #   z = []
  #   while parks.length >0
  #     z << parks.pop(1)
  #   end
  #
  #   final_park_addresses = []
  #   z.each do |p|
  #     final_park_addresses << p.join(",")
  #   end
    
    for n in 0...final_park_names.length do
      Park.create(name: final_park_names[n], address: final_park_addresses[n])
      binding.pry
    end
    binding.pry
  end 

end



# park_map = []
# page = Nokogiri::HTML(open("))
# x = page.css('ul.bodysmall a').map { |link| link['href'] }
# x.each do |p|
#   y = "http://outdoornebraska.ne.gov" + p
#   park_map << y
# end