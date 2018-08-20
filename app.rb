require 'sinatra'
require_relative 'isbn.rb'

enable :sessions

get '/' do
	erb :index
	
end

get '/index' do
		erb :index
end

# post '/index' do
# 	isbns = params[:isbns].to_s
# 	isbns1 = params[:isbns]
# 	erb :index, locals:{isbns: isbns, isbns1: isbns1}

# 	p "params are index post #{params}"
# 	redirect '/book_isbn_10?isbns=' + isbns
# end

post '/book_isbn_10' do
	isbns = params[:isbns]
	isbns1 = []
	isbns1 << isbns
	# isbns1 = params[:isbns]
	for isbn in isbns1
		puts "ISBN(#{isbn}) is valid? #{isValid(isbn)}"
	end
	valid = "#{isValid(isbn)}"
		p "params are index post #{params}"
	erb :book_isbn_10, locals:{isbns1: isbns1, isbns: isbns1, valid: valid}

end

get '/book_isbn_10' do

  end

get '/info' do
	erb :info
end

get '/story' do
	erb :story
end

get '/play' do
	erb :play
end