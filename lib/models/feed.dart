import 'package:womensafty/core/app_utils.dart';

class Feed {
  final int index;
  final String created;
  final int entryId;
  final double field1;
  final double field2;
  final double field3;

  Feed({
    this.index,
    this.created,
    this.entryId,
    this.field1,
    this.field2,
    this.field3,
  });
  factory Feed.fromJson(Map<String, dynamic> json, int index) {
    return Feed(
      index: index,
      created: AppUtils.formatDate(json['created_at']),
      entryId: json['entry_id'],
      field1: double.parse(json['field1']),
      field2: double.parse(json['field2']),
      field3: double.parse(json['field3']),
    );
  }
}
