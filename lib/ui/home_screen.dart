import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_zero_to_one/events.dart';
import 'package:flutter_zero_to_one/image_type.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/ui/about_page.dart';
import 'package:flutter_zero_to_one/ui/history/history_page.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';
import 'package:flutter_zero_to_one/wtf_bus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WtfBusEventMixin {
  @override
  void initState() {
    Utils.initialAPIAccessToken();
    Provider.of<HistoryNotifier>(context, listen: false).updateHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //可通过设置这个选项修改status 文字颜色
//        brightness: Brightness.dark,
        centerTitle: true,
        title: Text(
          '百草园',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.infoCircle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeedDial(
        marginBottom: 30,
        marginRight: 30,
        child: Icon(FontAwesomeIcons.bars),
        curve: Curves.bounceIn,
        overlayOpacity: 0.4,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.cat),
            backgroundColor: Colors.blue,
            label: '识别动物',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () async {
              Utils.getImage(await Utils.showImageSourceDialog(context, ImageType.animal), ImageType.animal, context);
            },
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.leaf),
            backgroundColor: Colors.green,
            label: '识别植物',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () async {
              Utils.getImage(await Utils.showImageSourceDialog(context, ImageType.plant), ImageType.plant, context);
            },
          ),
        ],
      ),
      body:  HistoryPage(),
    );
  }

  @override
  void dispose() {
    WtfBus().destroy();
    super.dispose();
  }

  @override
  void onEvent(Event event) async {
    if (event.body is DioError) {
      Utils.showNetWorkError(context);
    } else if (event.body is ReSelectEvent) {
      ReSelectEvent reSelectEvent = event.body;
      Utils.getImage(await Utils.showImageSourceDialog(context, reSelectEvent.type), reSelectEvent.type, context);
    }
  }
}
