import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AccessTokenEntity entity;
  Image _image;
  Image _resultImage;
  String _imageBase64;

  @override
  void initState() {
    getToken();
    super.initState();
  }

  void getToken() async {
    entity = await Utils.getAccessToken();
  }

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 800, maxHeight: 800);
    String base64 = Utils.imageFileToBase64(image);
    setState(() {
      _image = Utils.base64ToImage(base64);
    });
    _imageBase64 = base64;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                  child: _image == null
                      ? SizedBox(
                          height: 200,
                          child: Center(child: Text('请先添加图片')),
                        )
                      : _image),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: getImage,
                  ),
                  RaisedButton(
                    child: Text('黑白上色'),
                    onPressed: () async {
                      _resultImage = await Utils.colorize(_imageBase64, entity.accessToken);
                      setState(() {});
                    },
                  ),
                  RaisedButton(
                    child: Text('无损放大'),
                    onPressed: () async {
                      _resultImage = await Utils.imageQualityEnhance(_imageBase64, entity.accessToken);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('图像去雾'),
                    onPressed: () async {
                      _resultImage = await Utils.dehaze(_imageBase64, entity.accessToken);
                      setState(() {});
                    },
                  ),
                  RaisedButton(
                    child: Text('对比度增强'),
                    onPressed: () async {
                      _resultImage = await Utils.contrastEnhance(_imageBase64, entity.accessToken);
                      setState(() {});
                    },
                  ),
                  RaisedButton(
                    child: Text('拉伸回复'),
                    onPressed: () async {
                      _resultImage = await Utils.stretchRestore(_imageBase64, entity.accessToken);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                child: _resultImage == null ? SizedBox() : _resultImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
