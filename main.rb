require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "geocoder"

require "sqlite3"

require_relative "./models/park.rb"
require_relative "./models/person.rb"
require_relative "./models/story.rb"

get "/people" do
  @people = Person.all
  erb :people_index
end

get "/person/new" do
  erb :person_new
end

post "/person/create" do
  @person = Person.new({name: params["name"]})
  @person.save
  erb :person_create
end

get "/person/:id/edit" do
  @person = Person.find(params[:id])  
  erb :person_edit
end

post "/person/:id/update" do
  @person = Person.find(params[:id])
  @person.update_attributes({name: params["name"]})
  erb :person_update
end

get "/person/:id/delete" do
  @person = Person.find(params[:id]).delete
  erb :person_delete
end

get "/person/:id" do
  @person = Person.find(params[:id])
  erb :person_show
end

########
get "/parks" do
  @parks = Park.all
  erb :parks_index
end

get "/park/new" do
  erb :park_new
end

post "/park/create" do
  @park = Park.create({name: params["name"], address: params["address"]})
  erb :park_create
end

get "/park/:id/edit" do
  @park = Park.find(params[:id])  
  erb :park_edit
end

post "/park/:id/update" do
  @park = Park.find(params[:id])
  @park.update_attributes({name: params["name"], address: params["address"]})
  erb :park_update
end

get "/park/:id/delete" do
  @park = Park.find(params[:id]).delete
  erb :park_delete
end

get "/park/:id" do
  @park = Park.find(params[:id])
  erb :park_show
end

##########

get "/stories" do
  @stories = Story.all
  erb :stories_index
end

get "/story/new" do
  erb :story_new
end

post "/story/create" do
  @story = Story.create({story: params["story"], park_id: params["park_id"], person_id: params["person_id"]})
  erb :story_create
end

get "/story/:id/edit" do
  @story = Story.find(params[:id])
  erb :story_edit  
end

post "/story/:id/update" do
  @story = Story.find(params[:id])
  @story.update_attributes({story: params["story"], park_id: params["park_id"], person_id: params["person_id"]})
  erb :story_update
end

get "/story/:id/delete" do
  @story = Story.find(params[:id]).delete
  erb :story_delete
end

get "/story/:id" do
  @story = Story.find(params[:id])
  erb :story_show
end
