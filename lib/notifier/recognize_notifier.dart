import 'package:flutter/cupertino.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';

class RecognizeNotifier extends ChangeNotifier {
  ResultEntity _entity;

  ResultEntity get entity => _entity;

  void updateResult(ResultEntity entity) {
    _entity = entity;
    notifyListeners();
  }

  void clear() {
    _entity = null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
