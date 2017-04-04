class ArtistController < AppController

	get '/' do
		@artists = Artist.all
		erb :artist
	end


	get '/artist' do
		erb :artist

end

end