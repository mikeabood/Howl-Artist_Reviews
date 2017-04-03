require 'sinatra/base'

require './controllers/AppController'
require './controllers/HomeController'
# require './controllers/UserController'
# require './controllers/ArtistController'

require './models/UserModel'
require './models/ArtistModel'
require './models/CommentModel'

map('/') {run AppController}
map('/home') {run HomeController}
# map('/user') {run UserController}
# map('/artists') {run CommentController}