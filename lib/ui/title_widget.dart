import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  final num score;
  final String name;

  TitleWidget(this.score, this.name);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${(widget.score * 100).toStringAsFixed(2)}%  ',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
