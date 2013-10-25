class Node
  attr_accessor :connectors, :visited, :initial, :target, :distance, :position

  def initialize(attrs = {})
    @connectors = []
    @visited = false
    @initial = attrs[:initial] || false
    @target = attrs[:target] || false
    @distance = 0
    @position = attrs[:position]
  end

  def add_to_connector(connector)
    connectors << connector
  end

  def initial?
    initial
  end

  def visited?
    visited
  end

end