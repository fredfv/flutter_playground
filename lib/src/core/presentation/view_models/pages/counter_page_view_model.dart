import '../../pages/counter/counter_store.dart';

class CounterPageViewModel {
  final String title;
  final CounterStore store;

  CounterPageViewModel({
    required this.title,
    required this.store,
  });
}
