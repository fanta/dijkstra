require 'spec_helper'

describe Node do

  let(:node) { Node.new }
  let(:connector) { Connector.new }
  let(:second_connector) { Connector.new }

  it 'can belong many connectors' do
    node.add_to_connector(connector)
    node.add_to_connector(second_connector)
    node.connectors.length.should == 2
  end

  describe 'add_to_connector' do
    it 'adds the node to the given connector' do
      lambda { node.add_to_connector(connector) }.should change(node.connectors, :length).by(1)
    end
  end

end