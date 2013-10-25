require 'spec_helper'

describe Connector do
  let(:connector) { Connector.new }
  let(:node) { Node.new }
  let(:second_node) { Node.new }
  let(:third_node) { Node.new }

  describe 'connect_to_node' do
    it 'adds one node to it' do
      lambda { connector.connect_to_node(node) }.should change(connector.nodes, :length).by(1)
    end

    it 'adding more than two nodes, will raise an error' do
      connector.connect_to_node(node)
      connector.connect_to_node(second_node)
      lambda { connector.connect_to_node(third_node) }.should raise_error
    end
  end

  describe 'complete_nodes?' do
    it 'returns true if this connector has two nodes' do
      connector.connect_to_node(node)
      connector.connect_to_node(second_node)
      connector.complete_nodes?.should be_true
    end

    it 'return false if this connector has les than two nodes' do
      connector.connect_to_node(node)
      connector.complete_nodes?.should be_false
    end
  end
end