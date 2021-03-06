def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  until name.empty? do
  # add the student hash to the array
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  # get another name from the user
  name = gets.chomp
  end
  # return the array of students
  students
end

def print_header(students)
  if students.count == 0
    puts ""
  else
  puts "The students of my cohort at Makers Academy"
  puts "-----------------"
end
end

def print(students)
  if students.count == 0
    puts "*** You have not entered any data ***"
  else
  i = 0
  num = students.count
  until i >= num do
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name].capitalize}, #{student[:cohort]} cohort"
      i += 1
    end
  end
end
end


def print_footer(students)
  if students.count == 0
    puts ""
  else
  puts "Overall, we have #{students.count} great students"
end
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header(students)
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I dont know what you meant, try again"
    end
  end
end

interactive_menu
students = input_students
print_header(students)
print(students)
print_footer(students)
