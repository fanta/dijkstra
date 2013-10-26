require_relative 'graph.rb'
require_relative 'node.rb'
require_relative 'connector.rb'

graph = Graph.new

inital_node = Node.new(initial: true, position: 1)
second_node = Node.new(position: 2)

first_connector = Connector.new(distance: 7)
first_connector.connect_to_node(inital_node)
first_connector.connect_to_node(second_node)

second_connector = Connector.new(distance: 9)
third_node = Node.new(position: 3)
second_connector.connect_to_node(inital_node)
second_connector.connect_to_node(third_node)

third_connector = Connector.new(distance: 10)
third_connector.connect_to_node(second_node)
third_connector.connect_to_node(third_node)

fourth_connector = Connector.new(distance: 15)
fourth_node = Node.new(position: 4)
fourth_connector.connect_to_node(second_node)
fourth_connector.connect_to_node(fourth_node)

fifth_connector = Connector.new(distance: 11, target: true)
fifth_connector.connect_to_node(third_node)
fifth_connector.connect_to_node(fourth_node)

sixth_connector = Connector.new(distance: 6)
fifth_node = Node.new(position: 5)
sixth_connector.connect_to_node(fourth_node)
sixth_connector.connect_to_node(fifth_node)

seventh_connector = Connector.new(distance: 9)
sixth_node = Node.new(position: 6)
seventh_connector.connect_to_node(fifth_node)
seventh_connector.connect_to_node(sixth_node)

eighth_connector = Connector.new(distance: 2)
eighth_connector.connect_to_node(sixth_node)
eighth_connector.connect_to_node(third_node)

nineth_connector = Connector.new(distance: 14)
nineth_connector.connect_to_node(inital_node)
nineth_connector.connect_to_node(sixth_node)

graph.add_connector(first_connector, true)
graph.add_connector(second_connector)
graph.add_connector(third_connector)
graph.add_connector(fourth_connector)
graph.add_connector(fifth_connector)
graph.add_connector(sixth_connector)
graph.add_connector(seventh_connector)
graph.add_connector(eighth_connector)
graph.add_connector(nineth_connector)

graph.calculate
p graph.connectors.collect { |c| c.nodes.collect {|n| "#{n.position} - #{n.distance}"} }
p graph.nodes.collect {|n| p "#{n.position} ... #{n.short_path.compact.map(&:position)}"}