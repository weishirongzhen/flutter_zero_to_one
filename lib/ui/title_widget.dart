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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${(widget.score * 100).toStringAsFixed(3)}%  ',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
            Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
