import 'package:flutter_playground/src/core/domain/entities/counter_entity.dart';
import 'package:flutter_playground/src/core/domain/repositories/i_counter_repository.dart';
import 'package:flutter_playground/src/core/domain/usecases/i_usecase.dart';
import 'package:flutter_playground/src/core/presentation/view_models/counter_view_model.dart';

class IncrementCounterUsecase
    implements IUsecase<CounterViewModel, CounterViewModel> {
  //TODO CRIAR OS MAPPERS
  final ICounterRepository _counterRepository;

  IncrementCounterUsecase({required ICounterRepository counterRepository})
      : _counterRepository = counterRepository;

  @override
  Future<CounterViewModel> call(CounterViewModel counterViewModel) async {
    print(counterViewModel);

    int incrementedValue = counterViewModel.counter + 1;

    if (incrementedValue > 10 && incrementedValue <= 20) {
      incrementedValue += 1;
    } else if (incrementedValue > 20) {
      incrementedValue -= 5;
    }

    final newCounter = counterViewModel.copyWith(counter: incrementedValue);
    _counterRepository.put(CounterEntity(
        id: counterViewModel.id, counter: counterViewModel.counter));
    return newCounter;
  }
}
