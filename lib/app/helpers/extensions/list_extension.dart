extension ListExtension<E> on List<E> {
  List<T> mapIndexed<T>(T Function(E, int) f) {
    var index = 0;
    return map((e) => f(e, index++)).toList();
  }
}
