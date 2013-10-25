require 'spec_helper'

describe Graph do
  let(:graph) { Graph.new }
  let(:connector) { Connector.new(distance: 5) }
  let(:node) { Node.new }
  let(:second_node) { Node.new }
  let(:connector_without_nodes) { Connector.new }

  before do
    connector.connect_to_node(node)
    connector.connect_to_node(second_node)
  end

  describe 'adding a connector' do
    it 'adds the connector' do
      lambda { graph.add_connector(connector) }.should change(graph.connectors, :length).by(1)
    end

    it 'raises an error when the connector does not have at least two nodes' do
      lambda { graph.add_connector(connector_without_nodes) }.should raise_error
    end
  end
end