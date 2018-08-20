require 'csv'
COUNTRIES = Array.new(240)
i = 0
CSV.foreach "mim.csv").flatten
  COUNTRIES[i] = country[0]
  i = i + 1
end

class Fixnum
    # Extension method
    def isOdd() self % 2 != 0 end
end

def isValid( isbn )

    result = false

    if not isbn.to_s.empty?

        isbn = isbn.gsub("-", "").gsub(" ", "") #remove '-' and whitespaces
        
        case isbn.length
            
            when 10
                result = isValidISBN10(isbn)
            when 13
                result = isValidISBN13(isbn)
        end         
    end  

    return result
end

def isValidISBN10( isbn )

    result = false

    if /^\d{9}[\d,x]{1}$/.match( isbn )

        sum = 0

        for i in 0..8
            sum += isbn[i].to_i * (i + 1)
        end

        sum += if isbn[9] == 'x' then 10 else isbn[9].to_i end * 10

        result = sum % 11 == 0
    end

    return result
end

def isValidISBN13( isbn )

    result = false

    if /^\d{13}$/.match(isbn)

        sum = 0

        isbn.split("").each_with_index do |char, index|

            sum += char.to_i * if index.isOdd then 3 else 1 end
        end

        result = sum % 10 == 0
    end

    return result
end

isbns = [
    "9780470059029",
    "978-0-13-149505-0",
    "978 0 471 48648 0",
    "0471958697",
    "0-321-14653-0",
    "877195869x",
        "4780470059029",
        "0-321@14653-0",
        "877195x869",
]

for isbn in isbns
    puts "ISBN(#{isbn}) is valid? #{isValid(isbn)}"
end