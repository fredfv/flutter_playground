class CounterViewModel {
  final String id;
  final int counter;

  const CounterViewModel({
    required this.id,
    required this.counter,
  });

  CounterViewModel copyWith({
    String? id,
    int? counter,
  }) {
    return CounterViewModel(
      id: this.id,
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() {
    return 'CounterViewModel(id: $id, counter: $counter)';
  }
}
