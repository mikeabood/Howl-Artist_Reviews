class ArtistController < AppController

	get '/' do
		# puts params[:artist]
		# artist_name = params[:artist]
		
		# artist = Artist.find_by(name: artist_name).id

		# redirect "/artist/#{artist}"
		erb :artist
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

		@comment.to_json(:include => :user)

	end






end