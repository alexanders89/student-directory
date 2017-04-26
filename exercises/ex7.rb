def print_header
  puts "The students of Villains Academy".center(75)
  puts "-" * 80
end

def print(students)
  i = 0
  num = students.count
  until i >= num do
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:surname].upcase}, #{student[:name].capitalize}.
      (#{student[:cohort].capitalize} Cohort).
      Born #{student[:birthm].capitalize} #{student[:birthy]}.
      Country of origin: #{student[:born].upcase}"
    i +=1
  end
end
end

def print_footer(names)
  puts "-" * 80
  if names.count == 1
    puts "Overall we have #{names.count} great student"
  else
  puts "Overall we have #{names.count} great students"
end
end

def ask question
  puts question
  answer = gets.chomp
  return answer
end

def input_students
  puts ""
  puts "*** Welcome to the Ruby Student Directory ***".center(75)
  puts ""
  puts "-" * 80
  puts ""
  puts "We will now enter student information.".center(75)
  puts "To finish, just hit return twice".center(75)
  students = []
  name = ask "Student first name?"
  surname = ask "Student second name?"
  cohort = ask "Enter cohort"
  bday_mon = ask "Enter birthday month"
  bday_year = ask "Enter birthday year"
  born = ask "Enter country of birth"
  while !name.empty? do
    students << {name: name, surname: surname, cohort: cohort, birthm: bday_mon, birthy: bday_year, born: born}
    puts "Now we have #{students.count} students"
    name = ask "Student first name?"
    surname = ask "Student second name?"
    cohort = ask "Enter cohort"
    bday_mon = ask "Enter birthday month"
    bday_year = ask "Enter birthday year"
    born = ask "Enter country of birth"
    end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
