import 'dart:convert';

import 'package:health_application/ui/base/user_secure_storage.dart';

abstract class SearchHistoryProvider<SearchValueType> {
  SearchHistoryProvider({required this.limit});

  int limit;
  List<SearchValueType> get history;
  void pushEntry(SearchValueType newValue);
}

class FoodSearchHistoryProvider implements SearchHistoryProvider<String> {
  List<String> _history = [];

  FoodSearchHistoryProvider._() {
    init();
  }

  static final instance = FoodSearchHistoryProvider._();

  void init() async {
    final hisoryFromStorage = await UserSecureStorage().getValueForKey(forKey: UserKey.foodSearchHistory);
    // _history = jsonDecode(hisoryFromStorage);
  }


  @override
  void pushEntry(String newValue) async {
    if (_history.contains(newValue)) {
      _history.remove(newValue);
    }

    _history = [newValue, ..._history];
    if (_history.length > limit) {
      _history.removeLast();
    }

    await UserSecureStorage().setValue(value: jsonEncode(_history), forKey: UserKey.foodSearchHistory);
  }
  
  @override
  int limit = 10;

  @override 
  List<String> get history => List.from(_history);
}