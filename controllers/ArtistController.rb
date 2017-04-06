class ArtistController < AppController

	get '/' do
		# puts params[:artist]
		artist_name = params[:artist]
		
		artist = Artist.find_by(name: artist_name).id
		# p artist 
		# p 'artist is above'
		redirect "/artist/#{artist}"


	
	end


	get '/:id' do
		id = params[:id]
		@artist = Artist.find(id)
		
		erb :artist
	end


	post '/' do
		@comment = Comment.new
		@comment.comment = params[:comment]
		@comment.artist_id = params[:artist_id]
		@comment.user_id = session[:user_id]
		@comment.save



	end






end