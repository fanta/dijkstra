class Graph
  attr_reader :connectors

  def initialize
    @connectors = []
  end

  def add_connector(connector)
    raise 'incomplete connector' unless connector.complete_nodes?
    @connectors << connector
  end
end