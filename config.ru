require 'sinatra/base'

require './controllers/AppController'
require './controllers/HomeController'
require './controllers/UserController'
require './controllers/ArtistController'
require './controllers/ProfileController'
require './controllers/CommentController'

require './models/UserModel'
require './models/ArtistModel'
require './models/CommentModel'


map('/') {run AppController}
map('/home') {run HomeController}
map('/user') {run UserController}
map('/artist') {run ArtistController}
map('/profile') {run ProfileController}
map('/comment') {run CommentController}