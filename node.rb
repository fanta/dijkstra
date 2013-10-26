class Node
  attr_accessor :connectors, :visited, :initial, :target, :distance, :position, :references

  def initialize(attrs = {})
    @connectors = []
    @visited = false
    @initial = attrs[:initial] || false
    @target = attrs[:target] || false
    @distance = 0
    @position = attrs[:position]
    @references = []
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

  def short_path
    references.sort_by {|r| r.distance}
  end

end