load 'seat_block.rb'
load 'airplane_seats.rb'
puts "===================Airplane Project=========================="
puts "Enter number of seat blocks"
total_seat_blocks = gets.chomp.to_i

seat_blocks = []

total_seat_blocks.times do |i|
	puts "Enter number of rows in box #{i + 1}"
	rows = gets.chomp.to_i
	puts "Enter number of columns in box #{i + 1}"
	columns = gets.chomp.to_i

	s = SeatBlock.new(rows, columns)
	seat_blocks << s
end

airplane_seat = AirplaneSeats.new(seat_blocks)

puts "================Display airplane seats========================"
puts airplane_seat.display.inspect

puts "Enter Number of passengers in queue"
passengers = gets.chomp.to_i
passengers_list = (1..passengers).to_a

passengers_list.each do |passenger|
	airplane_seat.seat_booking(passenger)
end
puts "================Display airplane seats========================"
puts airplane_seat.display.inspect
