typedef WeightedAdjacencyMatrix = List<List<int>>;

class GraphEdge {
  final int to;
  final int weight;

  GraphEdge({
    required this.to,
    required this.weight
  });
}

typedef WeightedAdjacencyList = List<List<GraphEdge>>;