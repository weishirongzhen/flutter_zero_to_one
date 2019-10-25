import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';

class DescriptionWidget extends StatefulWidget {
  final BaiKeInfo info;

  DescriptionWidget(this.info);

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.info != null && widget.info.description != null) {
      return Column(
        children: <Widget>[
//          SizedBox(
//            height: 10,
//          ),
          Text(
            '${widget.info.description}',
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
