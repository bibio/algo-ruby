require 'test/unit'
require 'bellmanford'

class TC_BellmanFord < Test::Unit::TestCase
	def setup
	end
 
	# testdata
	#      2
	#   >a---b*
	#
	def test_twonode
		nodes = %w(a b).map { |l| BellmanFord::Node.new(l) }
		edges = [[0,1,2]].map { |l| 
			BellmanFord::Edge.new(nodes[l[0]],nodes[l[1]],l[2])
		}
		bf = BellmanFord.new(nodes,edges)
		bf.set_root(nodes[0])
		bf.relaxation
		assert_equal("a=>b(2)", bf.dump(nodes[1]))
	end

	# 
	# testdata
	#     3
	#  >a - c*
	#   2\ /2
	#     b
	#  
	def test_normal_node
		nodes = %w(a b c).map { |l| BellmanFord::Node.new(l) }
		edges = [[0,1,2],[1,2,2],[0,2,5]].map { |l| 
			BellmanFord::Edge.new(nodes[l[0]],nodes[l[1]],l[2])
		}
		bf = BellmanFord.new(nodes,edges)
		bf.set_root(nodes[0])
		bf.relaxation
		assert_equal("a=>b(2)=>c(4)", bf.dump(nodes[2]))
	end
	
	# 
	# testdata
	#     3
	#  >a---c*
	#   2\ /2
	#     b
	#
	def test_shortcut
		nodes = %w(a b c).map { |l| BellmanFord::Node.new(l) }
		edges = [[0,1,2],[1,2,2],[0,2,3]].map { |l| 
			BellmanFord::Edge.new(nodes[l[0]],nodes[l[1]],l[2])
		}
		bf = BellmanFord.new(nodes,edges)
		bf.set_root(nodes[0])
		bf.relaxation

		assert_equal("a=>c(3)", bf.dump(nodes[2]))
	end

	# 
	# testdata
	#       e
	#       |
	#  >a---b---c
	#       |
	#       d*
	#
	def test_branch
		nodes = %w(a b c d e).map { |l| BellmanFord::Node.new(l) }
		edges = [[0,1,2],[1,4,1],[1,2,5],[1,3,2]].map { |l| 
			BellmanFord::Edge.new(nodes[l[0]],nodes[l[1]],l[2])
		}
		bf = BellmanFord.new(nodes,edges)
		bf.set_root(nodes[0])
		bf.relaxation

		assert_equal("a=>b(2)=>d(4)", bf.dump(nodes[3]))
	end
end
