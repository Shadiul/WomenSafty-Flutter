import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';
import 'package:womensafty/models/channel.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel();

  Response response;
  Dio dio = new Dio();

  Channel channel;
  int resutLength = 100;

  List<FlSpot> spot1 = [];
  List<FlSpot> spot2 = [];
  List<FlSpot> spot3 = [];

  fetchChannel() async {
    setBusy(true);
    response = await dio.get(
        "https://api.thingspeak.com/channels/1244775/feeds.json?results=$resutLength");

    channel = Channel.fromJson(response.data);

    spot1 = channel.feeds
        .map((feed) => FlSpot(feed.index.toDouble(), feed.field1))
        .toList();
    spot2 = channel.feeds
        .map((feed) => FlSpot(feed.index.toDouble(), feed.field2))
        .toList();
    spot3 = channel.feeds
        .map((feed) => FlSpot(feed.index.toDouble(), feed.field3))
        .toList();

    setBusy(false);
  }
}
