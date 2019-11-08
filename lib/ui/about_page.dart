import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('关于'),
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
                        '''这个应用程序是我的公众号【码托邦】的【Flutter从零到上架应用商店】系列文章的示例App，代码以开源，更多介绍请关注我的微信公众号。\n\n此应用程序不会收集您的任何个人信息，所有的历史信息均保存在本地，不会上传，请放心使用。
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
