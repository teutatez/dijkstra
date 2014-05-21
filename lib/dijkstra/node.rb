module Dijkstra
  class Node
    attr_accessor :name, :distance, :previous

    def initialize(name, distance = nil, previous = nil)
      @name = name
      @distance = distance if distance
      @previous = previous if previous
    end

    def to_s
      name
    end

  end
end