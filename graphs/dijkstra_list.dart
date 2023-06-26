import 'weighted_adjacency_matrix_type.dart';


bool hasUnvisited({
  required List<bool> seen,
  required List<double> dists
}) {
  for (int i = 0; i < seen.length; i++) {
    if (!seen[i] && dists[i] < double.infinity) return true;
  }
  return false;
}

int getLowestUnvisited({
  required List<bool> seen,
  required List<double> dists
}) {
  int index = -1;
  double lowestDistance = double.infinity;

  for (int i = 0; i < seen.length; i++) {
    if (seen[i]) continue;
    
    if (lowestDistance > dists[i]) {
      lowestDistance = dists[i];
      index = i;
    }
  }

  return index;
}

List<int> DijkstraList({
  required int source,
  required int sink,
  required WeightedAdjacencyList graph
}) {

  final List<bool> seen = List.filled(graph.length, false);
  final List<int> prev = List.filled(graph.length, -1);
  final List<double> dists = List.filled(graph.length, double.infinity);

  dists[source] = 0;
  
  while (hasUnvisited(seen: seen, dists: dists)) {
    final curr = getLowestUnvisited(seen: seen, dists: dists);
    seen[curr] = true;

    final adj = graph[curr];
    for (final edge in adj) {
      if (seen[edge.to]) continue;

      final dist = dists[curr] + edge.weight;
      if (dist < dists[edge.to]) {
        dists[edge.to] = dist;
        prev[edge.to] = curr;
      }
    }
  }

  final List<int> out = [];
  int curr = sink;
  while (prev[curr] != -1) {
    out.add(curr);
    curr = prev[curr];
  }
  out.add(source);
  return out.reversed.toList();
}