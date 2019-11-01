import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDefault {
  static SharedPreferences pre;

  static Future init() async {
    pre = await SharedPreferences.getInstance();
    return Future.value(null);
  }

  /////////////////////////

  ///保存token
  static void saveToken(String token) async {
    await pre.setString("access_token", token);
  }

  static String getToken() {
    return pre.getString("access_token");
  }

  static Future<bool> removeToken() async {
    return pre.remove("access_token");
  }

  static void saveHistory(HistoryItem item) async {
    HistoryEntity oldHistoryEntity = HistoryEntity.fromJson(pre.getString("history") ?? '[]');
    HistoryEntity newHistoryEntity;
    if (oldHistoryEntity.list != null && oldHistoryEntity.list.length > 20) {
      newHistoryEntity = oldHistoryEntity.rebuild((update) => update..list.removeAt(0));
      if (newHistoryEntity.list.any((condition) => condition.name != item.name)) {
        newHistoryEntity = newHistoryEntity.rebuild((update) => update..list.add(item));
      }
    } else {
      newHistoryEntity = HistoryEntity((update) => update..list.add(item));
    }

    pre.setString('history', newHistoryEntity.toJson());
  }

  static Future<HistoryEntity> getHistory() async {
    String data = pre.getString("history");

    if (data == null) {
      String json = await rootBundle.loadString('assets/default_images/images.json');
      pre.setString('history', json);
      BuiltList<HistoryItem> list = deserializeListOf<HistoryItem>(jsonDecode(json));

      return HistoryEntity((update) => update..list.addAll(list));
    } else {
      BuiltList<HistoryItem> list = deserializeListOf<HistoryItem>(jsonDecode(data));
      return HistoryEntity((update) => update..list.addAll(list));
    }
  }
}
