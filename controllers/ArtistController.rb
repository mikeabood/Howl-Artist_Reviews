class ArtistController < AppController

	get '/' do
		@artists = Artist.all
		erb :artist
	end


	get '/:id' do
		id = params[:id]
		@artist = Artist.find(id)
		

		erb :artist

	end


	post '/' do
		erb :artist
	end

end