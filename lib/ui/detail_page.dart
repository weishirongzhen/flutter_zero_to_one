import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/ui/title_widget.dart';

class DetailPage extends StatelessWidget {
  final HistoryItem item;

  DetailPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(item.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 3 / 4,
                      width: MediaQuery.of(context).size.width * 3 / 4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File.fromUri(Uri.parse(item.imagePath))),
                          )),
                    ),
                  ),
                ),
                ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => Divider(
                          height: 4,
                        ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: item.result.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          TitleWidget(item.result[index].score, item.result[index].name),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              item.result[index].description ?? '暂无描述信息',
                              style: TextStyle(fontSize: 18, color: Colors.black87),
                            ),
                          ),
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
