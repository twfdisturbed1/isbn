require 'sinatra'
require_relative 'isbn.rb'
require 'csv'
require 'aws-sdk-s3'

enable :sessions

load "./local_env.rb" if File.exists?("./local_env.rb")

s3 = Aws::S3::Client.new(profile: 'twfdisturbed', region: 'us-east-1')

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
	isbns1 << isbns.gsub("\r", "").gsub("\n", "").downcase
	for isbn in isbns1
		puts "ISBN(#{isbn}) is valid? #{isValid(isbn)}"
	end
	valid = "#{isValid(isbn)}"
	isbns2 = "#{isbns1}"
		p "params are book isbn 10 post #{params}"
		p "params address form is #{params[:isbns]}"
	
			p "#{isbns}"
			p "#{valid}"
			CSV.open("public/csv/output_isbn_file1.csv", "a+") do |csv|
			 csv << ["#{isbns}", "#{valid}"] 
				end
	
		# Open a CSV file, and then read it into a CSV::Table object for data manipulation
		@csv_table = CSV.open("public/csv/output_isbn_file1.csv", :headers => true).read

	
		# valid = CSV.generate do |csv|
		# 	csv << ["ISBN", "VALIDITY"]	
		# 	csv << ["#{isbns}", "#{valid}"] 
				
		#   end

		s3 = Aws::S3::Resource.new(region: 'us-east-1')
		obj = s3.bucket("isbndm").object("output_isbn_file1.csv")
		File.open('public/csv/output_isbn_file1.csv', 'a+') do |file|
		obj.put(body: file)
end
		  
		# s3.put_object(bucket: 'isbndm', body: valid, key: "output_isbn_file1.csv")

		# s3.put_object(bucket: 'isbndm', body: output_isbn_file1.csv, key: "output_isbn_file1.csv")
		
		erb :book_isbn_10, locals:{isbns1: isbns1, isbns: isbns, valid: valid, isbns2: isbns, csv_table: @csv_table}

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

get '/playz' do
	erb :playz
end