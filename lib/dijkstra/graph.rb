module Dijkstra
  class Graph
    attr_accessor :edges, :nodes

    def initialize
      @edges = []
      @nodes = []
    end

    # adds the edge to the edges list and also adds the nodes to the nodes list if it doesn't already exist in the list
    def add_edge(edge)
      add_node(edge.source) unless contains_node?(edge.source.name)
      add_node(edge.destination) unless contains_node?(edge.destination.name)
      @edges << edge
    end

    # return node if it is found, otherwise returns nil
    def find(char)
      @nodes.each { |n| return n if char == n.name }
      nil
    end

    # returns true if a node exists for the particular character
    def contains_node?(char)
      @nodes.any? { |n| char == n.name }
    end

    private

    # adds the node to the node list
    def add_node(node)
      @nodes << node
    end

  end
end