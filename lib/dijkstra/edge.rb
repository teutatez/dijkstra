module Dijkstra
  class Edge
    attr_accessor :source, :destination, :weight

    def initialize(source, destination, weight)
      @source = source
      @destination = destination
      @weight = weight
    end

  end
end