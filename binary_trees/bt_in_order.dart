import 'binary_tree.dart';

void walkInOrder(BinaryNode<int>? curr, List<int> path) {
  if (curr == null) {
    return;
  }
  
  walkInOrder(curr.left, path);
  path.add(curr.value);
  walkInOrder(curr.right, path);
}

List<int> inOrderSearch(BinaryNode<int> head) {
  final List<int> path = <int>[];
  walkInOrder(head, path);
  return path;
}