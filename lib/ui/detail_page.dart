import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';

class DetailPage extends StatelessWidget {
  final HistoryItem item;

  DetailPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(item.name),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(item.description),
            ],
          ),
        ),
      ),
    );
  }
}
