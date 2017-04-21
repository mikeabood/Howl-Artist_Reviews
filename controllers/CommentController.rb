class CommentController < AppController
  
  # get '/:user_id' do
  #   user_id = params[:user_id]
  #   @user = User.find(user_id)
  #   @comments = @user.comments
  
  # end

  get '/:artist_id' do 
    id = params[:artist_id]
    comments = Comment.where(artist_id: id)
    comments.to_json(:include => :user)

  end

  post '/' do
    @comment = Comment.new
    @comment.content = params["content"]
    @comment.user_id = session[:user_id]
    @comment.save

    redirect '/home'
  end




  patch '/:id' do

  end

  delete '/:id' do

  end
end