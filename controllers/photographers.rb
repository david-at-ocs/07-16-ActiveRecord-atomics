

get "/photographers" do
  erb :"/photographers/main"
end

get "/photographers/view_all" do
  @photographers = Photographer.all
  erb :"/photographers/view_all"
end

get "/photographers/add" do
  erb :"/photographers/add"
end

get "/photographer/added" do
  @new_photog = Photographer.new({"name" => params["name"], "age" => params["age"]})
  if @new_photog.valid?
    @new_photog.save
    "Photographer Added"
    # for when I convert to json
    # @new_collab_hash = @new_collab.make_hash
    # json @new_collab_hash
  else
    @error = true
    erb :"/photographers/add"
  end
end

get "/photographers/edit" do
  @photographers = Photographer.all
  erb :"/photographers/edit"
end

get "/photographer/edited" do
  @photog_to_change = Photographer.find(params["photographer_id"].to_i)
  if !params["name"].empty?
    @photog_to_change.name = params["name"]
  end
  if !params["age"].empty?
    @photog_to_change.age = params["age"]
  end
  if @photog_to_change.valid?
    @photog_to_change.save
    "Photographer Changed"
    # for when I convert to json
    # @new_collab_hash = @new_collab.make_hash
    # json @new_collab_hash
  else
    @error = true
    erb :"/photographers/add"
  end
end