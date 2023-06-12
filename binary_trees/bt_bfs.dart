import 'dart:collection';

import 'binary_tree.dart';

bool bfs(BinaryNode<int> head, int needle) {
  final Queue<BinaryNode<int>?> queue = Queue<BinaryNode<int>?>();
  queue.addLast(head);
  
  while (queue.length != 0) {
    final curr = queue.removeFirst();
    if (curr == null) continue;

    if (curr.value == needle) return true;

    if (curr.left != null) queue.addLast(curr.left);
    if (curr.right != null) queue.addLast(curr.right);
  }

  return false;
}