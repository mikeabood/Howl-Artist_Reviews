class ArtistController < AppController

	get '/' do
		puts params[:artist]
	

	
	end


	get '/:id' do
		id = params[:id]
		@artist = Artist.find(id)
		

		erb :artist

	end


	post '/' do
		
		artist_name = params[:artist]
		
		artist = Artist.find_by(name: artist_name).id
		# p artist 
		# p 'artist is above'
		redirect "/artist/#{artist}"
	end

	
	

end