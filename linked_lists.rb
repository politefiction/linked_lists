class Node
	attr_accessor :value, :next_node
	def initialize (value=nil, next_node=nil)
		@value = value
		@next_node = next_node
	end

end

class LinkedList
	attr_accessor :list

	def initialize
		@list = Array.new
	end

	def append
		#added in random value for easier tracking
		@list << Node.new(rand(1..10))
		organize_list
	end

	def prepend
		@list.unshift(Node.new(rand(1..10)))
		organize_list
	end

	def insert_at(index)
		@list.insert(index, Node.new(rand(1..10)))
		organize_list
	end

	def remove_at(index)
		@list.delete_at(index)
		organize_list
	end

	def size
		@list.length
	end

	def head
		@list[0]
	end

	def tail
		@list[-1]
	end

	def at(index)
		@list[index]
	end

	def pop
		@list.pop
		organize_list
	end

	def contains?(val)
		contained = false
		@list.each { |node| contained = true if node.value == val }
		contained
	end

	def find(data)
		@list.each_with_index do |node, index|
			if node.value == data
				return index
			else
				nil
			end
		end
	end

	def to_s
		string = ""
		@list.each { |node| string += "( #{node.value} ) -> " }
		string + "nil"
	end

	#added extra function for possible 'linking' purposes
	def organize_list
		@list.each_with_index do |node, index|
			node.next_node = @list[index + 1] if index < (@list.length - 1)
		end
		@list[-1].next_node = nil
	end

end


=begin
test_list = LinkedList.new
test_list.append
test_list.append
test_list.prepend
test_list.list.each { |node| puts node.inspect }
puts
puts test_list.to_s
puts
test_list.list.each { |node| puts node.inspect }

	def link_hash
		@link_hash = { 
			@value => value,
			@next_node => next_node,
		}
	end

=end