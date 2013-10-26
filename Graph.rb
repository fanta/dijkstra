class Graph
  attr_reader :connectors

  def initialize
    @connectors = [nil]
  end

  def add_connector(connector, initial = false)
    raise 'incomplete connector' unless connector.complete_nodes?
    if initial
      @connectors[0] = connector
    else
      @connectors << connector
    end
  end

  def calculate
    calculate_distance(initial_node)
  end

  def calculate_distance(node)
    node.connectors.each do |connector|
      _node = connector.nodes.detect {|n| n != node}
      unless _node.visited?
        if(_node.distance == 0 || (_node.distance != 0 && (node.distance + connector.distance) < _node.distance))
          _node.distance = (connector.distance + node.distance)
          ([node] + node.references).each {|r| _node.references << r unless _node.references.include?(r)}
        end
      end
    end
    node.visited = true

    next_node = node.connectors.collect { |c| c.nodes.detect { |n| n != node && !n.visited? } }.compact.sort_by {|n| n.distance }.first
    calculate_distance(next_node) if next_node && !next_node.visited?
  end

  def initial_node
    @initial_node ||= @connectors.first.nodes.detect {|node| node.initial? }
  end

  def nodes
    nodes = []
    connectors.collect do |c|
      c.nodes.each {|n| nodes << n unless nodes.include?(n)}
    end.flatten
    nodes
  end

  def shortest_path
    target_node = nodes.detect(&:target)
    puts "The shortest path to go to #{target_node.position} is through #{target_node.path.map(&:position)}"
  end
end