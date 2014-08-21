
#this class has the following attributes: name, latitude, longitude, address, webaddress
class Park < ActiveRecord::Base
  has_and_belongs_to_many :people
  has_many :stories
  extend Geocoder::Model::ActiveRecord
 
  reverse_geocoded_by :latitude, :longitude

  # def self.import_parks
  #   page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/places/campmaps/campmaps.asp"))
  #   name_array = page.css('li')[0].text
  #   name_array.each do |name|
  #     puts name
  #   end
  #
  #   page = Nokogiri::HTML(open("http://outdoornebraska.ne.gov/parks/places/campmaps/campmaps.asp"))
  #   link_array = page.css('ul.bodysmall a').map { |link| link['href'] }
  #   link_array.each do |p|
  #     puts "http://outdoornebraska.ne.gov" + p
  #   end
  #
  #
  # end

end