@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  @students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  until name.empty? do
  # add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = gets.chomp
  end
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

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
else
  puts "-" * 80
  puts "I dont know what you mean, please try again"
  puts ""
end
end

def save_students
  file = File.open("students.csv" , 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


interactive_menu
