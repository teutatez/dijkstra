require File.dirname(__FILE__) + '/dijkstra/version'
require File.dirname(__FILE__) + '/dijkstra/graph'
require File.dirname(__FILE__) + '/dijkstra/edge'
require File.dirname(__FILE__) + '/dijkstra/node'

module Dijkstra

  # http://stackoverflow.com/questions/535721/ruby-max-integer
  FIXNUM_MAX = (2**(0.size * 8 -2) -1)

  # adds the nodes and edges to a graph and calls the dijkstra method
  def self.start(source, destination, edges)
    g = Graph.new

    edges.each do |edge|
      edge = edge.gsub('[', '').gsub(']', '').split(',')
      g.contains_node?(edge[0]) ? s = g.find(edge[0]) : s = Node.new(edge[0])
      g.contains_node?(edge[1]) ? d = g.find(edge[1]) : d = Node.new(edge[1])
      w = edge[2].to_i
      e = Edge.new(s, d, w)
      g.add_edge(e)
    end

    return("Unable to find node #{source} in graph") if (g.find(source).nil?)
    return("Unable to find node #{destination} in graph") if (g.find(destination).nil?)
    return dijkstra(g.find(source), g.find(destination), g)
  end

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
        return "No path from #{source} to #{destination}"
      end

      if u == destination
        path << u
        until u.previous.nil?
          path << u.previous
          u = u.previous
        end
        return "Shortest path is #{path.reverse} with total cost #{path.first.distance}"
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

