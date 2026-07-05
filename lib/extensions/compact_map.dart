extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([E? Function(T?)? transform]) {
    return map((transform ?? (el) => el)).where((e) => e != null).cast();
  }
}
