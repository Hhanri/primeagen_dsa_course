class MinHeap {
  int length = 0;
  final List<int> data = const [];

  MinHeap();
  void insert(int number) {
    data.add(number);
    _heapifyUp(length);
    length++;
  }

  int? delete() {
    if (length == 0) return null;

    int out = data[0];
    length--;
    if (length == 0) {
      data.clear();
      return out;
    }

    data[0] = data[length];
    _heapifyDown(0);
    return out;
  }

  void _heapifyUp(int index) {
    if (index == 0) return;

    final parent = _parent(index);
    final parentValue = data[parent];
    final currValue = data[index];

    if (parentValue > currValue) {
      data[parent] = currValue;
      data[index] = parentValue;
      _heapifyUp(parent);
    }
  }

  void _heapifyDown(int index) {
    final leftIndex = _leftChild(index);
    final rightIndex = _rightChild(index);

    if (index >= length ||leftIndex >= length) return;

    final leftValue = data[leftIndex];
    final rightValue = data[rightIndex];
    final currValue = data[index];
    
    if (leftValue > rightValue && currValue > rightValue) {
      data[index] = rightValue;
      data[rightIndex] = currValue;
      _heapifyDown(rightIndex);
    } else if (rightValue > leftValue && currValue > leftValue) {
      data[index] = leftValue;
      data[leftIndex] = currValue;
      _heapifyDown(leftIndex);
    }
  }

  int _parent(int index) {
    return ((index - 1) / 2).floor();
  }

  int _leftChild(int index) {
    return 2 * index + 1;
  }

  int _rightChild(int index) {
    return 2 * index + 1;
  }
}