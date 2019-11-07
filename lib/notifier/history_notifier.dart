import 'package:flutter/cupertino.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';

class HistoryNotifier extends ChangeNotifier {
  HistoryEntity _entity;

  HistoryEntity get entity => _entity;

  void updateHistory() async {
    _entity = await UserDefault.getHistory();
    notifyListeners();
  }
}
