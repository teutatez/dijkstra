require 'rspec'
require_relative '../lib/dijkstra'

describe Dijkstra do

  before :each do
    @graph = Dijkstra::Graph.new
    @edges = %w(A,B,1 A,C,2 B,C,3 B,D,3 C,D,1 B,E,2 D,F,3 D,E,3 E,G,3 F,G,1)
    @edges.each do |edge|
      edge = edge.split(',')
      @graph.contains_node?(edge[0]) ? s = @graph.find(edge[0]) : s = Dijkstra::Node.new(edge[0])
      @graph.contains_node?(edge[1]) ? d = @graph.find(edge[1]) : d = Dijkstra::Node.new(edge[1])
      w = edge[2].to_i
      e = Dijkstra::Edge.new(s, d, w)
      @graph.add_edge(e)
    end
    @a = @graph.find('A')
    @b = @graph.find('B')
    @c = @graph.find('C')
    @d = @graph.find('D')
    @e = @graph.find('E')
    @f = @graph.find('F')
    @g = @graph.find('G')
  end

  it 'should find the shortest path given a source, destination, and graph' do
    expect(Dijkstra::dijkstra(@a,@g,@graph)).to eq [@a, @b, @e, @g]
  end

  it 'should find the shortest path given a source, destination, and graph' do
    expect(Dijkstra::dijkstra(@a,@d,@graph)).to eq [@a, @c, @d]
  end

  it 'should find if there is no path given a source, destination, and graph' do
    expect(Dijkstra::dijkstra(@g,@a,@graph)).to eq false
  end

end