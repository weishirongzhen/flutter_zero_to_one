import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDefault {
  static SharedPreferences pre;

  static Future init() async {
    pre = await SharedPreferences.getInstance();
    return Future.value(null);
  }

  static Future<void> saveToken(String token) async {
    await pre.setString("access_token", token);
  }

  static String getToken() {
    return pre.getString("access_token");
  }

  static Future<bool> removeToken() async {
    return pre.remove("access_token");
  }

  ///保存token过期时间,传入参数为秒， 保存实际时间为millisecondsSinceEpoch
  static Future<void> setTokenExpireTime(int expireIn) async {
    DateTime now = DateTime.now();
    DateTime expire = now.add(Duration(seconds: expireIn));
    await pre.setInt("token_valid_time", expire.millisecondsSinceEpoch);
  }

  ///获取token过期时间，单位毫秒
  static int getTokenValidTime() {
    return pre.getInt("token_valid_time") ?? DateTime.now().millisecondsSinceEpoch;
  }

  ///删除对应index的历史
  static Future<bool> deleteHistory(int index) async {
    HistoryEntity history = await getHistory();
    history = history.rebuild((update) => update..list.removeAt(index));
    dynamic deletedWrapper = jsonDecode(history.toJson());
    return pre.setString('history', jsonEncode(deletedWrapper['list']));
  }

  ///保存用户查询历史，最大默认只保存100，超过100条则删除最旧一条
  static void saveHistory(HistoryItem item) async {
    BuiltList<HistoryItem> list = deserializeListOf<HistoryItem>(jsonDecode(pre.getString("history") ?? '[]'));
    HistoryEntity oldHistoryEntity = HistoryEntity((update) => update..list.addAll(list));
    HistoryEntity newHistoryEntity;
    if (oldHistoryEntity.list != null && oldHistoryEntity.list.length > 100) {
      newHistoryEntity = oldHistoryEntity.rebuild((update) => update..list.removeLast());
      newHistoryEntity = newHistoryEntity.rebuild((update) => update..list.insert(0, item));
    } else {
      newHistoryEntity = oldHistoryEntity.rebuild((update) => update..list.insert(0, item));
    }
    dynamic deletedWrapper = jsonDecode(newHistoryEntity.toJson());
    pre.setString('history', jsonEncode(deletedWrapper['list']));
  }


  ///获取历史，首次打开app会把assets中的默认数据，写入file保存
  static Future<HistoryEntity> getHistory() async {
    String data = pre.getString("history");

    if (data == null) {
      String json = await rootBundle.loadString('assets/default_images/images.json');
      BuiltList<HistoryItem> list = deserializeListOf<HistoryItem>(jsonDecode(json));

      ///把默认的asset里面的文件， 转换成file并保存到本地
      final reList = list.map((data) async {
        final imageBytes = await rootBundle.load(data.imagePath);
        final newPath = await Utils.saveImageFile(data.title, imageBytes.buffer.asUint8List());
        return data.rebuild((update) => update..imagePath = newPath);
      }).toList();

      ///reList是一个List<Future<HistoryItem>> ,需要变成 List<HistoryItem>
      final extractList = await Future.wait(reList);

      HistoryEntity entity = HistoryEntity((update) => update..list.addAll(extractList));

      dynamic jsonObject = jsonDecode(entity.toJson());
      pre.setString('history', jsonEncode(jsonObject['list']));
      return entity;
    } else {
      BuiltList<HistoryItem> list = deserializeListOf<HistoryItem>(jsonDecode(data));

      ///处理ios沙盒，每次更新之后Doc目录名改变之后，资源查找问题，以下代码修改旧路径为新路径
      if (Platform.isIOS) {
        final reList = list.map((f) async {
          Directory directory = await getApplicationDocumentsDirectory();
          return f.rebuild((update) => update..imagePath = directory.path + f.imagePath.substring(f.imagePath.lastIndexOf('/')));
        }).toList();

        final extractList = await Future.wait(reList);
        return HistoryEntity((update) => update..list.addAll(extractList));
      } else {
        return HistoryEntity((update) => update..list.addAll(list));
      }
    }
  }
}
