class Connector
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def connect_to_node(node)
    raise 'Only two nodes per connector are allowed' if @nodes.length == 2
    @nodes << node
  end

  def complete_nodes?
    @nodes.length == 2
  end
end