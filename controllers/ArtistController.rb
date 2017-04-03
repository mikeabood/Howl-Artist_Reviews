class ArtistController < AppController

	get '/' do
		@artists = Artist.all
	end


	get '/:'



end