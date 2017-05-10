load "queue.rb"
puts "===================Airplane Project=========================="
puts "Enter number of seat boxes"
total_boxes = gets.chomp.to_i
AVAILABLE = "X"
AISLE_SEAT = "A"
WINDOW_SEAT = "W"
OTHER_SEAT = "C"
@seats_queue = Queue.new


def arrange_seat_queue(array_of_seats)
	aisle_seat_arry = []
	window_seat_array = []
	other_seat_array = []

	array_of_seats.each_with_index do |value, index|
		value.each_with_index do |value1, index1|
			value1.each_with_index do |value2, index2|
				if value2 == AISLE_SEAT
					aisle_seat_arry << [index, index1, index2]
				elsif value2 == WINDOW_SEAT
					window_seat_array << [index, index1, index2]
				else
					other_seat_array << [index, index1, index2]
				end
			end
		end
	end
	
	aisle_seat_arry.sort_by!{|x,y|y}
	window_seat_array.sort_by!{|x,y|y}
	other_seat_array.sort_by!{|x,y|y}

	aisle_seat_arry.each do |a_s|
		@seats_queue.enqueue(a_s)
	end
	window_seat_array.each do |a_s|
		@seats_queue.enqueue(a_s)
	end
	other_seat_array.each do |a_s|
		@seats_queue.enqueue(a_s)
	end
end

def seat_audiences(passengers)
end

puts total_boxes
if total_boxes > 0
	seats = Array.new
	total_boxes.times do |i|
		puts "Enter number of rows in box #{i + 1}"
		row = gets.chomp.to_i
		puts "Enter number of columns in box #{i + 1}"
		col = gets.chomp.to_i
		if row == 0
			# puts "Invalid inputs"
			seats << []
		elsif col == 0
			# puts "Invalid inputs"
			seats << []
		else
			arr = []
			arr = Array.new(row){ Array.new(col, OTHER_SEAT)}
			new_arr = []
			arr.each do |a|
				if total_boxes == 1
					a[0] = WINDOW_SEAT
					a[col - 1] = WINDOW_SEAT
				elsif i == 0
					a[0] = WINDOW_SEAT
					a[col - 1] = AISLE_SEAT
				elsif (i == (total_boxes - 1))
					a[0] = AISLE_SEAT 
					a[col - 1] = WINDOW_SEAT
				else
					a[0] = AISLE_SEAT 
					a[col - 1] = AISLE_SEAT
				end
				new_arr  << a
			end

			seats << new_arr
		end
	end
	puts seats.inspect
	
	arrange_seat_queue(seats)


	puts "Enter Number of passengers in queue"
	passengers = gets.chomp.to_i

	# seat_audiences(passengers)
	if passengers > 0
		passengers_list = (1..passengers).to_a
		# seat_audiences(passengers)
		passengers_list.each do |passenger|
			position = @seats_queue.dequeue
			if position.nil?
				puts "Seat not available"
				break
			else
				seats[position[0]][position[1]][position[2]] = passenger
			end
		end
	end
	puts "==============================="
	puts seats.inspect
else
	puts "Seats are not available"
end

