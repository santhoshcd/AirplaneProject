class Queue

	def initialize
		@arr = []
	end

	def enqueue(element)
		@arr.unshift(element)
	end

	def dequeue
		@arr.pop
	end

	def display
		@arr
	end
end