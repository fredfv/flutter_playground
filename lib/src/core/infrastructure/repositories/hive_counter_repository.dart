import 'package:flutter_playground/src/core/domain/entities/counter_entity.dart';
import 'package:flutter_playground/src/core/domain/repositories/i_counter_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveCounterRepository implements ICounterRepository {
  //TODO PLUGAR O REALM
  //TODO CRIAR A ORM DE HIVE

  HiveCounterRepository() {
    init();
  }

  @override
  Future<CounterEntity> get() async {
    var box = Hive.box('value');
    return CounterEntity(
        counter: box.get('counter') ?? 0, id: box.get('id') ?? 'sem id');
  }

  @override
  Future<void> put(CounterEntity entity) async {
    var box = Hive.box('value');
    box.put('counter', entity.counter);
    box.put('id', entity.id);
  }

  Future<void> init() async {
    await Hive.initFlutter('hive');
    await Hive.openBox('value');
  }
}
