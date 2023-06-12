import 'binary_tree.dart';

void walkPostOrder(BinaryNode<int>? curr, List<int> path) {
  if (curr == null) {
    return;
  }
  
  walkPostOrder(curr.left, path);
  walkPostOrder(curr.right, path);
  path.add(curr.value);
}

List<int> postOrderSearch(BinaryNode<int> head) {
  final List<int> path = <int>[];
  walkPostOrder(head, path);
  return path;
}