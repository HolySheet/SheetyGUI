extension IntIterableUtility<int> on Iterable {
  sum<int>() => this.reduce((a, b) => a + b);
}

extension IterableUtility<T> on Iterable {
  sumMap<T>(int f(T e)) => this.map((x) => f(x)).reduce((a, b) => a + b);
}
