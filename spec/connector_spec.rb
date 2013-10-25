require 'spec_helper'

describe Connector do
  let(:connector) { Connector.new }
  let(:node) { Node.new }
  let(:second_node) { Node.new }
  let(:third_node) { Node.new }

  describe 'connecto_to_node' do
    it 'adds one node to it' do
      lambda { connector.connecto_to_node(node) }.should change(connector.nodes, :length).by(1)
    end

    it 'adding more than two nodes, will raise an error' do
      connector.connecto_to_node(node)
      connector.connecto_to_node(second_node)
      lambda { connector.connecto_to_node(third_node) }.should raise_error
    end
  end
end