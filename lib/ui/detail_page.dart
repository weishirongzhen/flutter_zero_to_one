import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/ui/title_widget.dart';

class DetailPage extends StatelessWidget {
  final HistoryItem item;
  final int index;

  DetailPage(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(item.title),
      ),
      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(
              File.fromUri(
                Uri.parse(item.imagePath),
              ),
            ),
          ),
        ),
        child: ClipRect( //如果不添加ClipRect会导致上级界面被BackdropFilter效果覆盖
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Hero(
                          tag: index,
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
                    ),
                    ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => Divider(
                              height: 20,
                              color: Colors.transparent,
                            ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: item.result.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              TitleWidget(item.result[index].score, item.result[index].name),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular((10.0)), //
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  child: Text(
                                    item.result[index].description ?? '暂无描述信息',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 4.0,
                                          color: Colors.black,
                                          offset: Offset(2.0, 2.0),
                                        ),
                                      ],
                                    ),
                                  ),
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
        ),
      ),
    );
  }
}
