import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/ui/detail_page.dart';

class HistoryItemWidget extends StatelessWidget {
  final HistoryItem item;

  HistoryItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            DottedBorder(
              borderType: BorderType.Circle,
              dashPattern: [6, 3, 2, 3],
              strokeWidth: 2,
              color: Colors.green,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(item.imagePath),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                item.name,
                style: TextStyle(shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ], fontSize: 24, color: Colors.white),
              ),
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  splashColor: Colors.white.withAlpha(200),
                  customBorder: CircleBorder(),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(item)));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
