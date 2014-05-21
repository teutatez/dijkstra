require File.dirname(__FILE__) + '/dijkstra/version'
require File.dirname(__FILE__) + '/dijkstra/graph'
require File.dirname(__FILE__) + '/dijkstra/edge'
require File.dirname(__FILE__) + '/dijkstra/node'

module Dijkstra

  # http://stackoverflow.com/questions/535721/ruby-max-integer
  FIXNUM_MAX = (2**(0.size * 8 -2) -1)

  #takes a source node, destination node, and a graph; returns false if no path is found or the path if it is found
  def self.dijkstra(source, destination, graph)
    path = []

    # assign every node a tentative distance of infinity, and zero for our source node
    graph.nodes.each { |n| n.distance = FIXNUM_MAX }
    source.distance = 0

    # mark all nodes unvisited
    unvisited = graph.nodes

    # visit each node
    while unvisited != []
      u = unvisited.min_by { |node| node.distance }
      unvisited.delete(u)

      if u.distance == FIXNUM_MAX
        return false
      end

      if u == destination
        path << u
        until u.previous.nil?
          path << u.previous
          u = u.previous
        end
        return path.reverse
      end

      neighbors = graph.edges.select { |edge| edge.source == u }
      neighbors.each do |v|
        alt = u.distance + v.weight
        if alt < v.destination.distance
          v.destination.distance = alt
          v.destination.previous = u
        end
      end
    end
  end

end

