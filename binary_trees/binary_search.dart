import 'binary_tree.dart';

bool search(BinaryNode<int>? curr, int needle) {
  if (curr == null) return false;
  if (curr.value == needle) return true;

  if (needle <= curr.value) {
    return search(curr.left, needle);
  } else {
    return search(curr.right, needle);
  }
}