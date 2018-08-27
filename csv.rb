require 'csv'
# CSV.parse(File.read('public/csv/input_isbn_file.csv')) 
def read_file_and_output
    file_old = File.open("public/csv/input_isbn_file.csv","r")
    file_name = "public/csv/isbn_output_test.csv"
    file_new = File.open(file_name, "w")
    file_old.each do |line|
      is_valid_isbn = isValid?(line)
    
        if is_valid_isbn == true
         file_new.puts line.chomp + ",valid"
        else 
        file_new.puts line.chomp + ",invalid"
                    end
        end
  
    file_new.close

end