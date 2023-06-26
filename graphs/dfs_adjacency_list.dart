import 'weighted_adjacency_matrix_type.dart';



bool walk({
  required WeightedAdjacencyList graph,
  required int curr,
  required int needle,
  required List<bool> seen,
  required List<int> path
}) {
  
  if (seen[curr]) return false;
  seen[curr] = true;

  path.add(curr);

  if (curr == needle) {
    return true;
  }

  final List<GraphEdge> list = graph[curr];

  for (int i = 0; i < list.length; i++) {
    final GraphEdge edge = list[i];

    if (
      walk(
        graph: graph, 
        curr: edge.to, 
        needle: needle, 
        seen: seen, 
        path: path
      )
    ) {
      return true;
    }
  }

  path.removeLast();

  return false;
}

List<int>? dfs({
  required WeightedAdjacencyList graph,
  required int source,
  required int needle,
}) {
  final List<bool> seen = List.filled(graph.length, false);
  final List<int> path = [];
  walk(graph: graph, curr: source, needle: needle, seen: seen, path: path);

  if (path.isEmpty) return null;
  return path;
}