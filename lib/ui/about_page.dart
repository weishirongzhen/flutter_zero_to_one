import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('关于'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.share),
            onPressed: () {
              if (Platform.isIOS) {
                Share.share("https://apps.apple.com/cn/app/%E6%88%91%E7%9A%84%E7%99%BE%E8%8D%89%E5%9B%AD/id1486070397");
              }
            },
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 200,
                        child: Image.asset('assets/images/app.webp'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        '${snapshot.hasData ? snapshot.data.appName : ''}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Version ${snapshot.hasData ? snapshot.data.version : ''}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        '''这个应用程序是我的公众号【码托邦】的【Flutter从零到上架应用商店】系列文章的示例App，代码以开源，更多介绍请关注我的微信公众号。\n\n此应用程序不会收集您的任何个人信息，所有的历史信息均保存在本地，不会上传，请放心使用。\n\n\n邮箱：memtopia@gmail.com\n网址：garden.memtopia.com
                        ''',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
