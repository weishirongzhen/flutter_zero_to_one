import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/ui/detail_page.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';
import 'package:provider/provider.dart';

class HistoryItemWidget extends StatelessWidget {
  final HistoryItem item;
  final int index;

  HistoryItemWidget(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            DottedBorder(
              borderType: BorderType.Circle,
              dashPattern: [6, 3, 2, 3],
              strokeWidth: 2,
              color: Colors.green,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File.fromUri(Uri.parse(item.imagePath))),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                item.title,
                style: TextStyle(shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ], fontSize: 24, color: Colors.white),
              ),
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  splashColor: Colors.white.withAlpha(200),
                  customBorder: CircleBorder(),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(item)));
                  },
                  onLongPress: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("删除 ${item.title}?"),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Text(
                              "取消",
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                          FlatButton(
                            onPressed: () async {
                              bool success = await UserDefault.deleteHistory(index);
                              if (success) {
                                Provider.of<HistoryNotifier>(context).initHistory();
                              }
                              Navigator.pop(context);
                            },
                            child: new Text(
                              "删除",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
