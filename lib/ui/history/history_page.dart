import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/ui/history/history_item.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryNotifier>(
      builder: (context, snapshot, _) {
        if (snapshot.entity != null) {
          return AnimationLimiter(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.entity.list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: 2,
                  position: index,
                  duration: Duration(milliseconds: 400),
                  child: ScaleAnimation(
                    scale: 0.1,
                    child: HistoryItemWidget(snapshot.entity.list[index], index),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
