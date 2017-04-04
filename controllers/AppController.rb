class AppController < Sinatra::Base
	enable :sessions

	require 'bundler'
	Bundler.require

	ActiveRecord::Base.establish_connection(
		:adapter => 'postgresql',
		:database => 'howl'
		)


	set :views, File.expand_path('../../views', __FILE__)
	set :public, File.expand_path('../../public', __FILE__)
  	set :session_secret, 'test'

	not_found do
		"NOT FOUND"
	end
end