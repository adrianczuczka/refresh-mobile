import 'package:flutter/material.dart';
import 'ShowPreview.dart';

class ShowList extends StatelessWidget {
  ShowList({Key key, this.previews}) : super(key: key);
  final List<ShowPreview> previews;

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: previews.length,
        itemBuilder: (context, index) {
          return previews[index];
        });
  }
}