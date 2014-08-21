ENV['RACK_ENV'] = 'test'

require "sinatra/activerecord"

require "sqlite3"

require_relative "../models/park.rb"
require_relative "../models/person.rb"
require_relative "../models/story.rb"

RSpec.configure do |config|
  Park.delete_all
  Person.delete_all
  Story.delete_all
end
