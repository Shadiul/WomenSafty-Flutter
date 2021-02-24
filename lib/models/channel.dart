import 'feed.dart';

class Channel {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String field1;
  final String field2;
  final String field3;
  final String created;
  final String updated;
  final int lastEntryId;
  final List<Feed> feeds;

  Channel({
    this.id,
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.field1,
    this.field2,
    this.field3,
    this.created,
    this.updated,
    this.lastEntryId,
    this.feeds,
  });
  factory Channel.fromJson(Map<String, dynamic> json) {
    List<Feed> _feeds = [];
    int index = 0;
    for (var _feed in json['feeds']) {
      _feeds.add(Feed.fromJson(_feed, index));
      index++;
    }
    return Channel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      field1: json['field1'],
      field2: json['field2'],
      field3: json['field3'],
      created: json['created_at'],
      updated: json['updated_at'],
      lastEntryId: json['last_entry_id'],
      feeds: _feeds,
    );
  }
}
