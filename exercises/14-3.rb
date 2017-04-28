#Ex 14-3
#Changed process method to interactive_menu_process
#


@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list"
  puts "4. Load list"
  puts "9. Exit"
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
    puts ""
    puts "Option 1. Input the Students selected"
    puts ""
    puts "-" * 80
    input_students
  when "2"
    puts ""
    puts "Option 2. Showing students"
    puts ""
    puts "-" * 80
    show_students
  when "3"
    puts ""
    puts "Option 3. Saving file"
    puts ""
    puts "-" * 80
    save_students
  when "4"
    puts ""
    puts "Option 4. Loading file"
    puts ""
    puts "-" * 80
    load_students
  when "9"
    puts ""
    puts "Option 9. Exiting program. Goodbye"
    puts ""
    puts "-" * 80
    exit
else
  puts "-" * 80
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
  user_save_file = gets.chomp
  puts "Saving file..."
  puts "*** File Saved ***"
  puts ""
  file = File.open("#{user_save_file}" , 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  puts ""
  puts "Enter filename to be loaded"
  user_file = gets.chomp
  puts "Loading file..."
  puts "*** File Loaded ***"
  puts ""
  puts "-" * 80
  file = File.open("#{user_file}" , 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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
