import 'dart:collection';

import 'weighted_adjacency_matrix_type.dart';

List<int>? bfs({
  required WeightedAdjacencyMatrix graph,
  required int source,
  required int needle,
}) {
  final seen = [for (int i = 0; i < graph.length; i++) false];
  final prev = [for (int i = 0; i < graph.length; i++) -1];

  seen[source] = true;
  final ListQueue<int> queue = ListQueue<int>.from([source]);

  do {
    final curr = queue.removeFirst();

    if (curr == needle) break;

    final adj = graph[curr];
    for (int i = 0; i < adj.length; i++) {
      if (adj[i] == 0 || seen[i]) continue;

      seen[i] = true;
      prev[i] = curr;
      queue.addLast(i);
    }
  } while (queue.length > 0);

  int curr = needle;
  List<int> out = [];

  while (prev[curr] != -1) {
    out.add(curr);
    curr = prev[curr];
  }

  if (out.isNotEmpty) {
    out.add(source);
    return out.reversed.toList();
  }
  return null;
}