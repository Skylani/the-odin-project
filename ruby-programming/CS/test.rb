require './node.rb'


def print_node(node)
  if node
    print node.value
    print ' ('
    if node.left
      print 'left: '
      print_node(node.left)
    end
    if node.right
      print 'right: '
      print_node(node.right)
    end
    print ') '
  end

end

puts "building new bst..."
data = [6,2,4,1,9,7,8,10]
bst = Bst.new
bst.build_tree(data)
print_node(bst.root)

puts "\nsearching bst for 8..."
inspect bst.bfs(8)



