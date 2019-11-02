import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_zero_to_one/image_type.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/ui/about_page.dart';
import 'package:flutter_zero_to_one/ui/history/history_page.dart';
import 'package:flutter_zero_to_one/ui/recognize_page.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';
import 'package:flutter_zero_to_one/wtf_bus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WtfBusEventMixin {
  @override
  void initState() {
    Utils.initialAPIAccessToken();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HistoryNotifier>(context).initHistory();
    });
    super.initState();
  }

  Future<void> _getImage(ImageSource source, ImageType type) async {
    final File imageFile = await ImagePicker.pickImage(source: source, maxWidth: 800, maxHeight: 800);

    if (imageFile != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => RecognizePage(imageFile, type)));
    }
  }

  Future<ImageSource> _showDialog(BuildContext context, ImageType type) async {
    return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("取消")),
            title: Text(
              type == ImageType.plant ? "选择植物" : "选择动物",
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.camera),
                      SizedBox(
                        width: 18,
                      ),
                      Text('拍照'),
                    ],
                  )),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.images),
                      SizedBox(
                        width: 18,
                      ),
                      Text('相册'),
                    ],
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '我的动植物园',
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
              _getImage(await _showDialog(context, ImageType.animal), ImageType.animal);
            },
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.leaf),
            backgroundColor: Colors.green,
            label: '识别植物',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () async {
              _getImage(await _showDialog(context, ImageType.plant), ImageType.plant);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: HistoryPage(),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WtfBus().destroy();
    super.dispose();
  }

  @override
  void onEvent(Event event) {
    if (event.body is DioError) {}
  }
}
