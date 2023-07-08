
class Node<T> {
  final T value;
  Node<T>? prev;
  Node<T>? next;

  Node({required this.value, this.prev, this.next});

  @override
  bool operator ==(covariant Object other) {

    if (identical(this, other)) {
      return true;
    }

    return other.runtimeType == Node
    && (other as Node<T>).value == this.value 
      && other.next == this.next
      && other.prev == this.prev;
  }

  @override
  int get hashCode {
    return value.hashCode;
  }
}

class LRU<K, V> {
  final int capacity;
  int _length = 0;
  Node<V>? head;
  Node<V>? tail;

  final Map<K, Node<V>> _lookUp = Map<K, Node<V>>();
  final Map<Node<V>, K> _reverselookUp = Map<Node<V>, K>();
  LRU({this.capacity = 10});
  
  void update(K key, V value) {
    Node<V>? node = _lookUp[key];
    if (node == null) {
      node = Node<V>(value: value);
      _length++;
      _prepend(node);
      _trimCache();

      _lookUp[key] = node;
      _reverselookUp[node] = key;
    } else {
      _detach(node);
      _prepend(node);
    }
  }

  V? get(K key) {
    final Node<V>? node = _lookUp[key];
    if (node == null) return null;

    _detach(node);
    _prepend(node);
    return node.value;
  }

  void _detach(Node<V> node) {
    if (node.prev != null) {
      node.prev!.next = node.next;
    }
    if (node.next != null) {
      node.next!.prev = node.prev;
    }

    if (head == node) {
      head = head?.next;
    }

    if (tail == node) {
      tail = tail?.prev;
    }
    node.prev = null;
    node.next = null;
  }

  void _prepend(Node<V> node) {
    if (head == null) {
      head = tail = node;
      return;
    }

    node.next = head;
    head?.prev = node;
    head = node;
  }

  void _trimCache() {
    if (_length <= capacity) {
      return;
    }

    final tail = this.tail;
    if (this.tail != null) _detach(this.tail!);

    final K? key = _reverselookUp[tail];
    _lookUp.remove(key);
    _reverselookUp.remove(tail);
    _length--;
  }

  @override
  String toString() {
    final List<String> res = <String>[];

    Node<V>? node = head;
    while (node != null) {
      res.add("${_reverselookUp[node]} -> ${node.value}");
      node = node.next;
    }

    return res.join("\n");
  }
}