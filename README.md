# Dijkstra

A Ruby implementation of the Dijkstra algorithm as described here: ([http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm]) 

## Installation

    $ gem build dijkstra.gemspec
    $ gem install --local dijkstra

## Usage
<pre>
Usage:
        $ dijkstra [FILE_NAME] [SOURCE_NODE] [DESTINATION_NODE]
Example:
        $ dijkstra my_graph.txt A G
        Shortest path is [A,B,E,G] with total cost 6
</pre>
The graph file will consist of a set of edges. Each edge names a starting node, a destination node, and the weight:
<pre>
[A,B,1]
[A,C,2]
[B,C,3]
[B,D,3]
[C,D,1]
[B,E,2]
[D,F,3]
[D,E,3]
[E,G,3]
[F,G,1]
</pre>

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dijkstra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
