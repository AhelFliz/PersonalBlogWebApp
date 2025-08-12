#!bin/rails runner

puts "User creation..."

puts "Enter the username: "
username = gets.chomp

user = User.find_by(username: username)

if user
  puts "Username already exists"
else
  puts "Enter password: "
  password =  $stdin.gets.strip

  puts "Confirm password: "
  confirm = $stdin.gets.strip

  unless confirm == password
    puts "Password is not the same"
    exit
  end

  user = User.create!(username: username, password: password, role: 10)

  puts "User added: #{user.username}"
end
