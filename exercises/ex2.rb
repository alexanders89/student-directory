def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def sort_students(students)
  puts "Please enter the letter you would like to search by:"
  letter = gets.chomp
  puts "Searching by the letter #{letter.upcase} and #{letter.downcase}"
  filtered = []
  unfiltered = []
  students.each_with_index do |student, index|
  unfiltered << student[:name]
end
filtered << unfiltered.select { |i| i.start_with?(letter.upcase, letter.downcase) }
puts filtered
end



students = input_students
print_header
print(students)
print_footer(students)
sort_students(students)
