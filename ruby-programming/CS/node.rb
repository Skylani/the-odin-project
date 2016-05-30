class Node
  attr_accessor :value, :parent, :left, :right, :visited

  def initialize(value)
    @value = value
  end
end

class Bst
  attr_reader :root

  # build a bst tree from an unsorted array
  def build_tree(data)
    data.each do |v|
      add_node(v)
    end
    self
  end

  def add_node(value)
    node = Node.new(value)

    # empty tree
    if @root == nil
      @root = node

    # not an empty tree
    else
      curr = @root

      # find the correct place to insert node
      while curr

        # new node greater than current node
        if curr.value < value

          # add to right if right is nil
          if !curr.right
            curr.right = node
            node.parent = curr
            curr = nil

          # keep going if right not nil
          else
            curr = curr.right
          end

        # new node smaller than current node
        else

          # add to left if left is nil
          if !curr.left
            curr.left = node
            node.parent = curr
            curr = nil

          # keep going if left not nil
          else
            curr = curr.left
          end
        end

      end # end while
    end
  end

  # breadth first search the tree and return node that has the target value
  def bfs(value)
    queue = [@root] # put root into the queue
    curr_ind = 0

    while curr_ind < queue.size
      curr = queue[curr_ind]
      if curr.value == value
        return curr

      # add children to queue
      else
        if curr.left
          return curr.left if curr.left.value == value
          queue << curr.left
        end

        if curr.right
          return curr.right if curr.right.value == value
          queue << curr.right
        end
      end
      curr_ind += 1

    end
    nil



  end
end