
get "/" do
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