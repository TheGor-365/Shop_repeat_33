hh = {}

loop do

  print "Enter product id: "
  id = gets.chomp

  print "Enter amount (how much items you want to order): "
  n = gets.chomp.to_i

  x = hh[id].to_i # read hash value zero if it not exists
  x = x + n       # increase by n
  hh[id] = x      # set hash value

  total = 0
  hh.each do |k, v| # calculate total number of items in cart
    total += v
  end

  puts "Total items in cart: #{total}" # puts total variable

  puts '---'
end
