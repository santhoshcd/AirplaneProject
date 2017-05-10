load "queue.rb"
class AirplaneSeats
	attr_reader :seats

	AISLE_SEAT = "A"
	WINDOW_SEAT = "W"
	CENTER_SEAT = "C"

	def initialize(seat_blocks = [])
		@seats = Array.new
		@seats_queue = Queue.new
		total_seat_boxes = seat_blocks.count
		seat_blocks.each_with_index do |seat_box, i|
			rows = seat_box.rows
			columns = seat_box.columns
			arr = []

			if rows != 0 || columns != 0
				array_of_seats = []
				array_of_seats = Array.new(rows){ Array.new(columns, CENTER_SEAT)}
				array_of_seats.each do |seat_row|
					if total_seat_boxes == 1
						seat_row[0] = WINDOW_SEAT
						seat_row[columns - 1] = WINDOW_SEAT
					elsif i == 0
						seat_row[0] = WINDOW_SEAT
						seat_row[columns - 1] = AISLE_SEAT
					elsif (i == (total_seat_boxes - 1))
						seat_row[0] = AISLE_SEAT 
						seat_row[columns - 1] = WINDOW_SEAT
					else
						seat_row[0] = AISLE_SEAT 
						seat_row[columns - 1] = AISLE_SEAT
					end
					arr  << seat_row
				end
			end
			@seats << arr
		end
		arrange_seats_queue
	end

	def display
		@seats
	end

	def seat_booking(passenger_name)
		position = @seats_queue.dequeue
		if position.nil?
			puts "Seat not available"
		else
			@seats[position[0]][position[1]][position[2]] = passenger_name
		end
	end

	private
	def arrange_seats_queue
		aisle_seat_arry = []
		window_seat_array = []
		other_seat_array = []

		@seats.each_with_index do |value, index|
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

end