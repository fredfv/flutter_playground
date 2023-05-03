import 'package:flutter_playground/src/core/presentation/view_models/counter_view_model.dart';

class CounterState {
  final CounterViewModel counterViewModel;
  final String text;

  const CounterState({
    required this.counterViewModel,
    required this.text,
  });

  factory CounterState.initial() {
    return const CounterState(
      counterViewModel: CounterViewModel(
        id: '1',
        counter: 0,
      ),
      text: 'You have pushed the button this many times:',
    );
  }

  CounterState copyWith({CounterViewModel? counterViewModel, String? text}) {
    return CounterState(
      counterViewModel: counterViewModel ?? this.counterViewModel,
      text: text ?? this.text,
    );
  }
}
