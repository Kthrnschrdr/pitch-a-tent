
get "/" do
  @people = Person.all
  erb :"people/people_index"
end

get "/person/new" do
  erb :"people/person_new"
end

post "/person/create" do
  @person = Person.new({name: params["name"]})
  @person.save
  erb :"people/person_create"
end

get "/person/:id/edit" do
  @person = Person.find(params[:id])  
  erb :"people/person_edit"
end

post "/person/:id/update" do
  @person = Person.find(params[:id])
  @person.update_attributes({name: params["name"]})
  erb :"people/person_update"
end

get "/person/:id/delete" do
  @person = Person.find(params[:id]).delete
  erb :"people/person_delete"
end

get "/person/:id" do
  @person = Person.find(params[:id])
  erb :"people/person_show"
end