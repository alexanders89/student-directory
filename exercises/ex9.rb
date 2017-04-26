def print_header
  puts "The students of Villains Academy".center(75)
  puts "-" * 80
end

def print_by_cohort(students)
  list_by_cohort = students.group_by {|input| input[:cohort]}
    puts "Students listed by cohort:".center(75)
      list_by_cohort.map do |key, value|
        puts "#{key.capitalize}"
        for index in 0..value.size-1 do
      puts "#{index + 1}. #{value[index][:surname].upcase}, #{value[index][:name].capitalize}
      Born: #{value[index][:birthm].capitalize}-#{value[index][:birthy]}
      Country of origin: #{value[index][:born].upcase}"
    end
  end
end

def print(students)
  i = 0
  num = students.count
  until i >= num do
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:surname].upcase}, #{student[:name].capitalize}.
      Cohort:#{student[:cohort].capitalize}
      Born: #{student[:birthm].capitalize}-#{student[:birthy]}
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
puts "-" * 80
puts ""
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
  if surname == '' ; surname = 'NA(surname)' end
  cohort = ask "Enter cohort"
  if cohort == '' ; cohort = 'NA' end
  bday_mon = ask "Enter birthday month"
  if bday_mon == '' ; bday_mon = 'NA' end
  bday_year = ask "Enter birthday year"
  if bday_year == '' ; bday_year = 'NA' end
  born = ask "Enter country of birth"
  if born == '' ; born = 'NA' end
  while !name.empty? do
    students << {name: name, surname: surname, cohort: cohort, birthm: bday_mon, birthy: bday_year, born: born}
    puts "Now we have #{students.count} students"
    name = ask "Student first name?"
    surname = ask "Student second name?"
    if surname == '' ; surname = 'NA(surname)' end
    cohort = ask "Enter cohort"
    if cohort == '' ; cohort = 'NA' end
    bday_mon = ask "Enter birthday month"
    if bday_mon == '' ; bday_mon = 'NA' end
    bday_year = ask "Enter birthday year"
    if bday_year == '' ; bday_year = 'NA' end
    born = ask "Enter country of birth"
    if born == '' ; born = 'NA' end
    end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
print_by_cohort(students)
