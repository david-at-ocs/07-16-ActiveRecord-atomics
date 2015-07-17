

get "/" do
  erb :"/home"
end

get "/photographers" do
  erb :"/photographers"
end

get "/view_photographers" do
  @photographers = Photographer.all
  erb :"/view_all_photographers"
end

get "/add_photographer" do
  @photographers = Photographer.all
  erb :"/add_photographer"
end

get "/photographer_added" do
  @new_photog = Photographer.new({"name" => params["name"], "age" => params["age"]})
  if @new_photog.valid?
    @new_photog.save
    "Photographer Added"
    # for when I convert to json
    # @new_collab_hash = @new_collab.make_hash
    # json @new_collab_hash
  else
    @error = true
    erb :"add_photographer"
  end
end