require 'csv'

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list"
  puts "4. Load list"
  puts "9. Exit"
end

def break_line
  puts ""
  puts "-" * 80
  puts ""
end

def interactive_menu
  loop do
    print_menu
    interactive_menu_process(STDIN.gets.chomp)
  end
end

def interactive_menu_process(selection)
  case selection
  when "1"
    break_line
    puts "Option 1. Input the Students selected"
    break_line
    input_students
  when "2"
    break_line
    puts "Option 2. Showing students"
    break_line
    show_students
  when "3"
    break_line
    puts "Option 3. Saving file"
    break_line
    save_students
  when "4"
    break_line
    puts "Option 4. Loading file"
    break_line
    load_students
  when "9"
    break_line
    puts "Option 9. Exiting program. Goodbye"
    break_line
    exit
else
  break_line
  puts "I dont know what that means, please try again"
  puts ""
end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @students = []
  name = STDIN.gets.chomp
  until name.empty? do
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
  name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  if @students.count == 0
    puts ""
  else
  puts "The students of my cohort at Makers Academy"
  puts "-----------------"
end
end

def print_student_list
  if @students.count == 0
    puts "*** You have not entered any data ***"
    puts "-" * 80
  else
  i = 0
  num = @students.count
  until i >= num do
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name].capitalize}, #{student[:cohort]} cohort"
      i += 1
    end
  end
end
end

def print_footer
  if @students.count == 0
    puts ""
  else
  puts "Overall, we have #{@students.count} great students"
  puts "-" * 80
  puts ""
end
end

def save_students
  puts ""
  puts "Please enter the filename you would like to save under"
  user_save_file = STDIN.gets.chomp
  CSV.open(user_save_file , "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "#{@students.count} students saved to #{user_save_file}"
  puts ""
end

def load_students
  puts ""
  puts "Enter filename to be loaded"
  user_file = STDIN.gets.chomp
  return if user_file.nil?
  if File.exists?(user_file)
    CSV.foreach(user_file) do |student|
      name, cohort = student
      @students << {name: name, cohort: cohort.to_sym}
    end
  end
  puts "#{@students.count} students loaded from #{user_file}"
  puts ""
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    puts""
    puts "No file specified, students2.csv loaded"
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

interactive_menu
