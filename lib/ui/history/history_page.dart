import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/ui/history/history_item.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer<HistoryNotifier>(
      builder: (context, snapshot, _) {
        if (snapshot.entity != null) {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.entity.list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return HistoryItemWidget(snapshot.entity.list[index], index);
            },
          );
        } else {
          return SizedBox();
        }
      },
    ));
  }
}
