########
get "/parks" do
  @parks = Park.all
  erb :"parks/parks_index"
end

get "/park/new" do
  erb :"parks/park_new"
end

post "/park/create" do
  @park = Park.create({name: params["name"], address: params["address"]})
  erb :"parks/park_create"
end

get "/park/:id/edit" do
  @park = Park.find(params[:id])
  erb :"parks/park_edit"
end

post "/park/:id/update" do
  @park = Park.find(params[:id])
  @park.update_attributes({name: params["name"], address: params["address"]})
  erb :"parks/park_update"
end

get "/park/:id/delete" do
  @park = Park.find(params[:id]).delete
  erb :"parks/park_delete"
end

get "/park/:park_id" do
  @park = Park.find(params["park_id"])
  @stories = @park.stories
  erb :"parks/park_show"
end

get "/person/:id/parks_nearby" do
  @person = Person.find(params[:id])
  @person.location = (params["location"])
  @parks_nearby = Park.near(@person.location, 150)
  erb :"parks/parks_nearby"
end

get "/person/:id/favorite_parks" do
  @person = Person.find(params[:id])
  @park = Park.find(params["park_id"])
  @person.parks<<@park
  erb :"parks/favorite_parks"
end