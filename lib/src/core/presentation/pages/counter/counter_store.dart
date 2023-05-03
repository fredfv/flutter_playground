import 'package:flutter/material.dart';

import '../../../application/usecases/increment_counter_usecase.dart';
import '../../states/counter_state.dart';

class CounterStore extends ValueNotifier<CounterState> {
  final IncrementCounterUsecase _incrementCounterUsecase;

  CounterStore({
    required IncrementCounterUsecase incrementCounterUsecase,
  })  : _incrementCounterUsecase = incrementCounterUsecase,
        super(CounterState.initial());

  void incrementCounter() async {
    print('increment');
    print(value.hashCode);
    value = value.copyWith(
      counterViewModel: await _incrementCounterUsecase(
        value.counterViewModel,
      ),
    );
    print(value.hashCode);
  }
}
