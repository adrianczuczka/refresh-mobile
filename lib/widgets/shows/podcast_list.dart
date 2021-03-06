import 'package:flutter/material.dart';
import 'package:fresh_air/widgets/shows/podcast.dart';

class PodcastList extends StatelessWidget {
  PodcastList({Key key, this.data}) : super(key: key);

  final List<Podcast> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return data[index];
      },
    );
  }
}
