import 'dart:async';

import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/state_restorable.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_repository.dart';

abstract class MealRecordStreamProtocol implements StateRestorable<List<MealRecordItem>> {
  MealRecordStreamProtocol(List<MealRecordItem> value): value = value;
  MealRecordStreamProtocol listen(Function(List<MealRecordItem>) item);
  
  final List<MealRecordItem> value;
  void updateItemList(List<MealRecordItem> meals);
  void cancel();
}

class MealRecordStream implements MealRecordStreamProtocol {
  MealRecordStream() {
    _subscription = stream.listen((event) { _listeners.forEach((listener) { listener(event); });});
  }
  late StreamSubscription<List<MealRecordItem>> _subscription;

  List<Function(List<MealRecordItem>)> _listeners = [];

  @override 
  List<MealRecordItem> value = [];
  
  @override
  List<MealRecordItem> snapshot = [];

  StreamController<List<MealRecordItem>> _streamController = StreamController<List<MealRecordItem>>.broadcast();

  Stream<List<MealRecordItem>> get stream => _streamController.stream;

  @override 
  void updateItemList(List<MealRecordItem> meals) {
    value = meals;
    _streamController.sink.add(meals);
  }

  @override 
  MealRecordStreamProtocol listen(Function(List<MealRecordItem>) onUpdate) {
    if (!_listeners.contains(onUpdate)) {
      _listeners.add(onUpdate);
    }
    return this;
  }

  @override 
  void cancel() {
    _subscription.cancel();
  }
  
  @override
  void createSnapshot(List<MealRecordItem> state) {
    snapshot = List.from(state);
  }
  
  @override
  List<MealRecordItem> restoreState() {
    updateItemList(snapshot);
    return List.from(snapshot);
  }
}