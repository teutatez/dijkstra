require 'rspec'
require_relative '../lib/dijkstra'

describe Dijkstra::Node do

  before :each do
    @prev = Dijkstra::Node.new('B',10)
    @node = Dijkstra::Node.new('A',10,@prev)
  end

  it 'should have a name' do
    expect(@node.name).to eq 'A'
  end

  it 'should have a distance' do
    expect(@node.distance).to eq 10
  end

  it 'should store a previous node' do
    expect(@node.previous).to eq @prev
  end

end
