##########

get "/person/:id/stories" do
  @person = Person.find(params[:id])
  @stories = @person.stories
  erb :stories_index
end

get "/person/:id/story/new" do
  @person = Person.find(params[:id])
  erb :story_new
end

post "/person/:id/story/create" do
  @person = Person.find(params[:id])
  @story = Story.create({story: params["story"], park_id: params["park_id"], person_id: params[:id]})
  binding.pry
  erb :story_create
end

get "/person/:id/story/:id/edit" do
  @person = Person.find(params[:id])
  @story = Story.find(params[:id])
  erb :story_edit  
end

post "/person/:id/story/:id/update" do
  @person = Person.find(params[:id])
  @story = Story.find(params[:id])
  @story.update_attributes({story: params["story"], park_id: params["park_id"], person_id: params[:id]})
  erb :story_update
end

get "/person/:id/story/:id/delete" do
  @person = Person.find(params[:id])
  @story = Story.find(params[:id]).delete
  erb :story_delete
end

get "/person/:id/story/:id" do
  @person = Person.find(params[:id])
  @story = Story.find(params[:id])
  erb :story_show
end