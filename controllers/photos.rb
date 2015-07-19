

get "/photos" do
  erb :"/photos/main"
end

get "/photos/view_all" do
  @photos = Photo.all
  erb :"/photos/view_all"
end

get "/photos/add" do
  @photographers = Photographer.all
  @albums = Album.all
  erb :"/photos/add"
end

get "/photo/added" do
  # @photographer = Photographer.find(params["photographer_id"].to_i)
  albums = Album.get_albums_to_add(params)
    new_photo = Photo.new({"title" => params["title"], "description" => params["description"], "link" => params["link"], "photographer_id" => params["photographer_id"].to_i})
  if new_photo.valid?
    # @photographer.photos.create({"title" => params["title"], "description" => params["description"], "link" => params["link"]})
    new_photo.albums << albums
    binding.pry
    new_photo.create
    "Photo Added"
    # for when I convert to json
    # @new_collab_hash = @new_collab.make_hash
    # json @new_collab_hash
  else
    @error = true
    erb :"/photos/add"
  end
end

get "/photos/edit" do
  @photos = Photo.all
  @photographers = Photographer.all
  @albums = Album.all
  erb :"/photos/edit"
end

get "/photo/edited" do
  @photo_to_change = Photo.find(params["photo_id"].to_i)
  
  if !params["title"].empty?
    @photo_to_change.title = params["title"]
  end
  if !params["description"].empty?
    @photo_to_change.description = params["description"]
  end
  if !params["link"].empty?
    @photo_to_change.link = params["link"]
  end
  if !params["photographer_id"].empty?
    @photo_to_change.photographer_id = params["photographer_id"]
  end
  if !params["album_id"].empty?
    # @photo_to_change.photographer_id = params["album_id"]
  end
  
  if @photo_to_change.valid?
    @photo_to_change.save
    "Photo Updated"
    # for when I convert to json
    # @new_collab_hash = @new_collab.make_hash
    # json @new_collab_hash
  else
    @error = true
    erb :"/photographers/add"
  end
end

get "/photos/:id" do
  @photo = Photo.find(params["id"].to_i)
  erb :"/photos/view_photo"
end