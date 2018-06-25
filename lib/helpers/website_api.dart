import 'package:fresh_air/widgets/events/event_preview.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fresh_air/widgets/shows/show_details.dart';
import 'package:fresh_air/widgets/shows/podcast.dart';

class WebsiteAPI {
  static var _url = "https://freshair.org.uk/api/";

  static Future<List<ShowData>> getAllShows() async {
    var list = await http.read(_url + "shows/all").then((shows) {
      List<ShowData> list = new List();
      List showsMap = json.decode(shows);
      showsMap.forEach((item) {
        ShowData show = new ShowData.fromJson(item);
        list.add(show);
      });
      return list;
    });
    return list;
  }

  static Future<List<PodcastData>> getPodcastsByShow(String slug) async {
    var list = await http.read(_url + "podcasts/" + slug).then((podcasts) {
      List<PodcastData> list = new List();
      List podcastsMap = json.decode(podcasts);
      podcastsMap.forEach((item) {
        PodcastData podcast = new PodcastData.fromJson(item);
        list.add(podcast);
      });
      return list;
    });
    return list;
  }

  static Future<List<EventData>> getAllEvents() async {
    Future<List<EventData>> future = new Future(() {
      return [
        new EventData("Event Name", "6/19/2018", "6/25/2018", "Liquid Rooms",
            "This is an event"),
      ];
    });
    return future;
    /*
    var list = await http.read(_url + "/all").then((events) {
      List<EventData> list = new List();
      List eventsMap = json.decode(events);
      eventsMap.forEach((item) {
        EventData event = new EventData.fromJson(item);
        list.add(event);
      });
      return list;
    });
    return list;*/
  }
}