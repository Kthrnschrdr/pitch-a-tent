require 'rubygems'
require 'bundler'
Bundler.require

require_relative "./models/park.rb"
require_relative "./models/person.rb"
require_relative "./models/story.rb"

require_relative "./routes/parks.rb"
require_relative "./routes/people.rb"
require_relative "./routes/stories.rb"