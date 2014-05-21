require 'rspec'
require_relative '../lib/dijkstra'

describe Dijkstra::Graph do

  before :each do
    @src_node = Dijkstra::Node.new('A')
    @dst_node = Dijkstra::Node.new('B')
    @edge = Dijkstra::Edge.new(@src_node, @dst_node, 10)
    @graph = Dijkstra::Graph.new
  end

  it 'should have nodes' do
    expect(@graph.nodes).to eq []
  end

  it 'should have edges' do
    expect(@graph.edges).to eq []
  end

  it 'should store an edge' do
    @graph.add_edge(@edge)
    expect(@graph.edges).to eq [@edge]
  end

  it 'should store a node' do
    @graph.add_node(@src_node)
    expect(@graph.nodes).to eq [@src_node]
  end

  it 'should enable finding nodes from node name' do
    @graph.add_node(@src_node)
    expect(@graph.find('A')).to eq @src_node
  end

  it 'should return nil if it couldnt find a node' do
    @graph.add_node(@src_node)
    expect(@graph.find('B')).to eq nil
  end

  it 'should enable checking if it contains a node from node name' do
    @graph.add_node(@src_node)
    expect(@graph.contains_node?('A')).to eq true
  end

  it 'should prevent adding the same node more than once' do
    @graph.add_node(@src_node)
    @graph.add_edge(@edge)
    expect(@graph.nodes).to eq [@src_node,@dst_node]
  end

end
