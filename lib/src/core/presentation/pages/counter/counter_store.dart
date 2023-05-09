import 'package:flutter/material.dart';
import 'package:flutter_playground/src/core/application/usecases/decrement_counter_usecase.dart';
import 'package:flutter_playground/src/core/application/usecases/get_counter_usecase.dart';

import '../../../application/usecases/increment_counter_usecase.dart';
import '../../states/counter_state.dart';

class CounterStore extends ValueNotifier<CounterState> {
  final IncrementCounterUsecase _incrementCounterUsecase;
  final DecrementCounterUsecase _decrementCounterUsecase;
  final GetCounterUsecase _getCounterUsecase;
  CounterStore({
    required IncrementCounterUsecase incrementCounterUsecase,
    required DecrementCounterUsecase decrementCounterUsecase,
    required GetCounterUsecase getCounterUsecase,
  })  : _incrementCounterUsecase = incrementCounterUsecase,
        _decrementCounterUsecase = decrementCounterUsecase,
        _getCounterUsecase = getCounterUsecase,
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

  void desincrementCounter() async {
    print('decrement');
    print(value.hashCode);
    value = value.copyWith(
      counterViewModel: await _decrementCounterUsecase(
        value.counterViewModel,
      ),
    );
    print(value.hashCode);
  }
}
