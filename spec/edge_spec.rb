require 'rspec'
require_relative '../lib/dijkstra'

describe Dijkstra::Edge do

  before :each do
    @src_node = Dijkstra::Node.new('A')
    @dst_node = Dijkstra::Node.new('B')
    @edge = Dijkstra::Edge.new(@src_node, @dst_node, 10)
  end

  it 'should have a source node' do
    expect(@edge.source).to eq @src_node
  end

  it 'should have a destination node' do
    expect(@edge.destination).to eq @dst_node
  end

  it 'should have a weight' do
    expect(@edge.weight).to eq 10
  end

end
