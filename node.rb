class Node
  attr_accessor :connectors

  def initialize
    @connectors = []
  end

  def add_to_connector(connector)
    connectors << connector
  end

end