@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
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
  puts "Saving file..."
  puts "*** File Saved ***"
  puts ""
  file = File.open("students.csv" , 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = 'students.csv')
  puts ""
  puts "Loading file..."
  puts "*** File Loaded ***"
  puts ""
  file = File.open("students2.csv" , 'r')
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

try_load_students
interactive_menu
