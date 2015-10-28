class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all
  end
def show

@selectedphoto = Photo.find_by({:Id => params["id"].to_f})
@list_of_photos = Photo.all

render("photos.html.erb")
end

def new_form

render("new_form.html.erb")

end

def create_row


@createphoto = Photo.new
@createphoto.source = params["the_source"]
@createphoto.caption = params["the_caption"]
@createphoto.save

redirect_to("http://localhost:3000/photos")

end

def destroy

@selectedphoto = Photo.find_by({:Id => params["id"].to_f})
@selectedphoto.destroy

redirect_to("http://localhost:3000/photos")

end

def edit_form

@selectedphoto = Photo.find_by({:Id => params["id"].to_f})


render("edit.html.erb")

end


def update_row


@editphoto = Photo.find_by({:Id => params["id"].to_f})
@editphoto.source = params["the_source"]
@editphoto.caption = params["the_caption"]
@editphoto.save


redirect_to("http://localhost:3000/photos/#{@editphoto.id}")

end



end
