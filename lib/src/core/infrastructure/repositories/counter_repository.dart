import 'package:flutter_playground/src/core/domain/entities/counter_entity.dart';
import 'package:flutter_playground/src/core/domain/repositories/i_counter_repository.dart';

class CounterRepository implements ICounterRepository {
  //TODO PLUGAR O REALM
  //TODO CRIAR A ORM DE HIVE

  @override
  Future<CounterEntity> get() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => const CounterEntity(id: 'idTest', counter: 0),
    );
  }

  @override
  Future<void> put(CounterEntity entity) async {
    print(entity);
  }
}
