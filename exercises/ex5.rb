def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  i = 0
  num = students.count
  until i >= num do
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:surname].upcase}, #{student[:name].capitalize}.  (#{student[:cohort]} cohort). Born #{student[:birthm].capitalize} #{student[:birthy]}. Country of origin: #{student[:born].upcase}"
    i +=1
  end
end
end

def print_footer(names)
  puts "--------------"
  if names.count == 1
    puts "Overall we have #{names.count} great student"
  else
  puts "Overall we have #{names.count} great students"
end
end

def input_students
  puts ""
  puts "*** Welcome to the Ruby Student Directory ***"
  puts ""
  puts "--------------"
  puts ""
  puts "We will now enter student information."
  puts "To finish, just hit return twice"
  students = []
  puts "Enter first name:"
  name = gets.chomp
  puts "Enter second name:"
  surname = gets.chomp
  puts "Enter birthday month"
  bday_mon = gets.chomp
  puts "Enter birthday year"
  bday_year = gets.chomp
  puts "Enter country of birth"
  born = gets.chomp
  while !name.empty? do
    students << {name: name, surname: surname, cohort: :November, birthm: bday_mon, birthy: bday_year, born: born}
    puts "Now we have #{students.count} students"
    puts "Enter first name:"
    name = gets.chomp
    puts "Enter second name:"
    surname = gets.chomp
    puts "Enter birthday month"
    bday_mon = gets.chomp
    puts "Enter birthday year"
    bday_year = gets.chomp
    puts "Enter country of birth"
    born = gets.chomp
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
