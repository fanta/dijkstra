class Connector
  attr_reader :nodes
  attr_reader :distance

  def initialize(attrs = {})
    @nodes = []
    @distance = attrs[:distance]
  end

  def connect_to_node(node)
    raise 'Only two nodes per connector are allowed' if @nodes.length == 2
    @nodes << node
    node.add_to_connector(self)
  end

  def complete_nodes?
    @nodes.length == 2 && distance
  end
end