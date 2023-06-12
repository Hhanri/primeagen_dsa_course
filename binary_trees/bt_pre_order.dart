import 'binary_tree.dart';

void walkPreOrder(BinaryNode<int>? curr, List<int> path) {
  if (curr == null) {
    return;
  }
  
  path.add(curr.value);
  walkPreOrder(curr.left, path);
  walkPreOrder(curr.right, path);
}

List<int> preOrderSearch(BinaryNode<int> head) {
  final List<int> path = <int>[];
  walkPreOrder(head, path);
  return path;
}