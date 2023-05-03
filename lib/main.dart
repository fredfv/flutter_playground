import 'package:flutter/material.dart';
import 'package:flutter_playground/src/core/application/usecases/increment_counter_usecase.dart';
import 'package:flutter_playground/src/core/infrastructure/repositories/counter_repository.dart';
import 'package:flutter_playground/src/core/infrastructure/repositories/hive_counter_repository.dart';
import 'package:flutter_playground/src/core/presentation/pages/counter/counter_page.dart';
import 'package:flutter_playground/src/core/presentation/pages/counter/counter_store.dart';
import 'package:flutter_playground/src/core/presentation/view_models/pages/counter_page_view_model.dart';

void main() {
  final HiveCounterRepository counterRepository = HiveCounterRepository();
  //final CounterRepository counterRepository = CounterRepository();
  final IncrementCounterUsecase incrementCounterUsecase = IncrementCounterUsecase(counterRepository: counterRepository);
  final CounterStore counterStore = CounterStore(incrementCounterUsecase: incrementCounterUsecase);
  final CounterPageViewModel counterPageViewModel = CounterPageViewModel(title: 'Flutter ValueListenable', store: counterStore);

  runApp(MyApp(counterPageViewModel: counterPageViewModel));
}

class MyApp extends StatelessWidget {
  final CounterPageViewModel _counterPageViewModel;
  const MyApp({super.key, required CounterPageViewModel counterPageViewModel}) : _counterPageViewModel = counterPageViewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(viewModel: _counterPageViewModel),
    );
  }
}
