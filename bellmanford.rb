class BellmanFord

	class Node
		attr_accessor :distance, :label, :predecessor
		def initialize(label)
			@label = label
		end

		def to_s
			puts "label   : #{@label}"
			puts "distance: #{@distance}"
			puts "predecessor: #{@predecessor.nil? ? "" : @predecessor.label}"
		end
	end

	class Edge
		attr_accessor :source, :destination, :weight
		def initialize(source,destination,weight)
			@source = source
			@destination = destination
			@weight = weight
		end
	end

	def initialize(nodes,edges)
		@nodes = nodes
		@edges = edges
	end

	def set_root(root)
		@root = root
		@nodes.each do |node|
			if root == node
				node.distance = 0
			else
				node.distance = 10000
			end
			node.predecessor = nil
		end
	end

	def traverse(to)
		nodes = [to]
		@nodes.size.times do |t|
			if nodes.last.predecessor.nil?
				break
			end
			nodes << nodes.last.predecessor
		end
		nodes.reverse.each do |node|
			yield node
		end
	end

	def dump(to)
		str = ""
		traverse(to) do |n|
			if n == @root
				str += "#{n.label}"
			else
				str += "=>#{n.label}(#{n.distance})"
			end
		end
		str
	end
	
	def relaxation
		raise RuntimeError, "Please set_root(root)" if @root.nil?
		(@nodes.size-1).times do |t|
			@edges.each do |edge|
				u = edge.source
				v = edge.destination
				if u.distance + edge.weight < v.distance
					v.distance = u.distance + edge.weight
					v.predecessor = u
				end
			end
		end
	end

	def exist_minus_closer?
		@edges.each do |edge|
			u = edge.source
			v = edge.destination
			if u.distance + edge.weight < v.distance
				return true 
			end
		end
		return false
	end
end
