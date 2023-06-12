class Node<T> {
  final T value;
  Node<T>? prev;
  Node<T>? next;

  Node({required this.value, this.prev, this.next});
}

class DoublyLinkedList<T> {
  late int length;
  Node<T>? head;
  Node<T>? tail;

  DoublyLinkedList() {
    length = 0;
  }

  void prepend(T item) {
    final newNode = Node<T>(value: item);

    if (head == null) {
      head = tail = newNode;
      return;
    }

    newNode.next = head;
    head?.prev = newNode; 
    head = newNode;
    length++;
  }

  void insertAt(T item, int index) {

    if (index > length) {
      throw Error();
    } else if (index == length) {
      append(item);
      return;
    } else if (index == 0) {
      prepend(item);
      return;
    }

    length++;

    final curr = _getAt(index);

    final newNode = Node<T>(
      value: item, 
      prev: curr?.prev, 
      next: curr
    );

    curr?.prev = newNode; 

    if (newNode.prev != null) {
        newNode.prev?.next = curr; 
    }
  }

  void append(T item) {
    length++;
    final node = Node<T>(
      value: item,
    );

    if (tail == null) {
      head = tail = node;
      return;
    }

    node.prev = tail;
    tail?.next = node;
    tail = node;
  }

  T? remove(T item) {
    Node<T>? curr = head;
    for (int i = 0; i < length && curr != null; i++) {
      if (curr.value == item) break;
      curr = curr.next;
    }

    if (curr == null) return null;

    return _removeNode(curr);
  }

  T? get(int index) {
    Node<T>? current = head;
    for (int i = 0; i < index && current != null; i++) {
      current = current.next;
    }
    return current?.value;
  }

  T? removeAt(int index) {
    final curr = _getAt(index);
    if (curr == null) return null;
    return _removeNode(curr);
  }

  Node<T>? _getAt(int index) {
    Node<T>? curr = head;
    
    for (int i = 0; i < index && curr != null; i++) {
      curr = curr.next;
    }
    return curr;
  }

  T? _removeNode(Node<T> node) {
    length--;

    if (length == 0) {
      final out = head?.value;
      head = tail = null;
      return out;
    }

    if (node.prev != null) {
      node.prev?.next = node.next;
    }
    if (node.next != null) {
      node.next?.prev = node.prev;
    }

    if (node == head) {
      head = node.next;
    }
    if (node == tail) {
      tail = node.prev;
    }

    node.prev = node.next = null;

    return node.value;
  }
}