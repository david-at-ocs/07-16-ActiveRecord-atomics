

get "/albums" do
  erb :"/albums/main"
end

get "/albums/view_all" do
  @albums = Album.all
  erb :"/albums/view_all"
end

get "/albums/add" do
  # @photographers = Photographer.all
  # @albums = Album.all
  erb :"/albums/add"
end

get "/album/added" do
  @new_album = Album.new({"title" => params["title"], "description" => params["description"]})
  if @new_album.valid?
    @new_album.save
    "Album Added"
    # for when I convert to json
    # @new_collab_hash = @new_collab.make_hash
    # json @new_collab_hash
  else
    @error = true
    erb :"/albums/add"
  end
end

get "/albums/edit" do
  @albums = Album.all
  erb :"/albums/edit"
end

get "/album/edited" do
  @album_to_change = Album.find(params["album_id"].to_i)
  
  if !params["title"].empty?
    @album_to_change.title = params["title"]
  end
  if !params["description"].empty?
    @album_to_change.description = params["description"]
  end
  
  if @album_to_change.valid?
    @album_to_change.save
    "Album Changed"
    # for when I convert to json
    # @new_collab_hash = @new_collab.make_hash
    # json @new_collab_hash
  else
    @error = true
    erb :"/albums/add"
  end
end