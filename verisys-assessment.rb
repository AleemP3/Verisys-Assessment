#gems used to complete the assessment 
require 'rubygems'
require 'json'
require 'csv' 
require 'pry' 

# store csv files in an array
@csv_files = ["sample10.csv", "sample50.csv","sample100k.csv"]

#interface menu options stored in array 
@interface_options = ["Upload CSV file", "View Deleted records", "exit"]

# arrays to store csv files data and deleted records
@customers = []
@sample10 = []
@sample50 = []
@sample100k = [] 
@removed_records_sample = []

#command line interface menu method
def interface_menu 
  puts "Welcome Vandelay Industries employee"
  puts "please select what you would like to do"

  @interface_options.each.with_index {|option, index| 
    puts "#{index + 1}) #{option}"}
    
  selection = gets.to_i

  case selection 
    when 1
      generate_sample_customers
    when 2
      view_removed_records
    when 3
      exit
    else 
      puts "invalid option"
      interface_menu 
  end
end 

#method to clean up all phone numbers to have format (###) ###-####
def phone_number_clean_up(sample_array)
  sample_array.each do |phone_number|
    if phone_number["Phone 1 number"] != nil 
      @phone_number_one_array = phone_number["Phone 1 number"].split("")
      
      @phone_number_one_array.each do |number|
        if number == "." or number == "-"
          @phone_number_one_array.delete(number)
        end
      end 

      if @phone_number_one_array.length > 10
        @phone_number_one_array.delete_at(0)
      end

      @phone_number_one_array.insert(0, "(")
      @phone_number_one_array.insert(4, ")")
      @phone_number_one_array.insert(5, " ")
      @phone_number_one_array.insert(9, "-")
      phone_number["Phone 1 number"] = @phone_number_one_array.join
    end 

    if phone_number["Phone 2 number"] != nil
      @phone_number_two_array = phone_number["Phone 2 number"].split("")

      @phone_number_two_array.each do |number|
        if number == "." or number == "-"
          @phone_number_two_array.delete(number)
        end
      end 

      if @phone_number_two_array.length > 10
        @phone_number_two_array.delete_at(0)
      end

      @phone_number_two_array.insert(0, "(")
      @phone_number_two_array.insert(4, ")")
      @phone_number_two_array.insert(5, " ")
      @phone_number_two_array.insert(9, "-")
      phone_number["Phone 2 number"] = @phone_number_two_array.join
    end

    if phone_number["Phone 3 number"] != nil
      @phone_number_three_array = phone_number["Phone 3 number"].split("")

      @phone_number_three_array.each do |number|
        if number == "." or number == "-"
          @phone_number_three_array.delete(number)
        end
      end 

      if @phone_number_three_array.length > 10
        @phone_number_three_array.delete_at(0)
      end

      @phone_number_three_array.insert(0, "(")
      @phone_number_three_array.insert(4, ")")
      @phone_number_three_array.insert(5, " ")
      @phone_number_three_array.insert(9, "-")
      phone_number["Phone 3 number"] = @phone_number_three_array.join
    end
  end 
end 

#view deleted records method
def view_removed_records
  File.write 'removed_records_sample.json', JSON.pretty_generate(@removed_records_sample)
    @removed_records_sample.each do |deleted_record|
      puts deleted_record 
    end
  interface_menu 
end

#method to validate license numbers and remove invalid records 
def validate_license_numbers(sample_array)
  
  sample_array.each do |customer_object|
    if customer_object["License number"] == nil
      sample_array.delete(customer_object) 
      @removed_records_sample << customer_object
    end 
  end 
  
  sample_array.each do |license_number|
    
    @integer_license_number_array = []
    @license_number_array = license_number["License number"].split("")
    
    @license_number_array.each do |num|
      @integer_license_number_array << num.to_i 
    end 

    if @integer_license_number_array.length == 10 
      #setting a variable to be the last element in the license array
      @check_digit = @integer_license_number_array.last()
      #setting new variable to the updated array
      @license_number_array_minus_check_digit = @integer_license_number_array

      @validation_total = @license_number_array_minus_check_digit.reduce(0) { |sum, number| sum + number } - @check_digit
  
      if @validation_total % 10 != @check_digit
        sample_array.delete(license_number)
        @removed_records_sample << license_number
      end 

    else 
      sample_array.delete(license_number) 
      @removed_records_sample << license_number
    end
  end
end 

#method to to process CSV files 
def generate_sample_customers
  puts "please select which file you would like to upload" 

  @csv_files.each.with_index {|csv, index| 
    puts "#{index + 1}) #{csv}"}
    
  selection = gets.to_i
  
  case selection 
    when 1
      CSV.foreach("sample10.csv", :headers => true) do |row|
        @sample10 << row.to_h
        @customers << row.to_h
      end
      phone_number_clean_up(@sample10)
      validate_license_numbers(@sample10)
        File.write 'sample10.json', JSON.pretty_generate(@sample10)
      puts "JSON file completed"
        interface_menu 
    when 2
      CSV.foreach("sample50.csv", :headers => true) do |row|
        @sample50 << row.to_h
        @customers << row.to_h
      end
      phone_number_clean_up(@sample50)
      validate_license_numbers(@sample50)
        File.write 'sample50.json', JSON.pretty_generate(@sample50)
      puts "JSON file completed"
        interface_menu 
    when 3
      CSV.foreach("sample100k.csv", :headers => true) do |row|
        @sample100k << row.to_h
        @customers << row.to_h
      end
      phone_number_clean_up(@sample100k)
      validate_license_numbers(@sample100k)
        File.write 'sample100k.json', JSON.pretty_generate(@sample100k)
      puts "JSON file completed"
        interface_menu 
    else 
      puts "invalid option"
      generate_sample_customers
    end
end

interface_menu

