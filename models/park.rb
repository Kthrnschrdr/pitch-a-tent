
#this class has the following attributes: name, latitude, longitude, address, park_url
class Park < ActiveRecord::Base
  has_and_belongs_to_many :people
  has_many :stories
 
  extend Geocoder::Model::ActiveRecord
  geocoded_by :address   # can also be an IP address
  after_validation :geocode 

  def self.import_parks
  
    page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/guides/contact.asp"))
    park_sections = page.css("table[width='570'] tr").each_slice(5)
    park_sections.each do |p|
      first_name = p[0].css('span.bodysmall_bold').text
      last_name = p[1].css('span.bodysmall_bold').text
      street_address = p[0].css('span.bodysmall').text
      city = p[1].css('span.bodysmall').text
      webaddress = p[3].css('a.bodysmall_bold').text
      
      last_name.gsub!(/\r\n/, '')
    
      Park.create(name: "#{first_name} #{last_name}", address: "#{street_address} #{city}", park_url: "http://outdoornebraska.ne.gov/ + #{webaddress}")
      
    end
  end    
   
end
