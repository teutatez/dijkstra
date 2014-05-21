require 'rspec'
require_relative '../lib/dijkstra'

describe Dijkstra do

  before :each do
    @edges = %w([A,B,1] [A,C,2] [B,C,3] [B,D,3] [C,D,1] [B,E,2] [D,F,3] [D,E,3] [E,G,3] [F,G,1])
  end

  it 'should find the shortest path given a source, destination, and graph' do
    expect(Dijkstra::start('A','G',@edges)).to eq 'Shortest path is [A, B, E, G] with total cost 6'
  end

  it 'should find if there is no path given a source, destination, and graph' do
    expect(Dijkstra::start('G','A',@edges)).to eq 'No path from G to A'
  end

  it 'should find if the source isnt in the graph' do
    expect(Dijkstra::start('Z','A',@edges)).to eq 'Unable to find node Z in graph'
  end

  it 'should find if the destination isnt in the graph' do
    expect(Dijkstra::start('A','Z',@edges)).to eq 'Unable to find node Z in graph'
  end

end