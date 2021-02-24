import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:womensafty/core/app_utils.dart';

class Report {
  final String id;
  final String timestamp;
  final double bloodPreassure;
  final double heartRate;
  final double temperature;

  Report({
    this.id,
    this.timestamp,
    this.bloodPreassure,
    this.heartRate,
    this.temperature,
  });

  factory Report.fromSnapshot(DocumentSnapshot snapshot) {
    return Report(
      id: snapshot.id,
      timestamp: AppUtils.timestampToString(snapshot.data()['timestamp']),
      bloodPreassure: snapshot.data()['bloodPreassure'],
      heartRate: snapshot.data()['heartRate'],
      temperature: snapshot.data()['temperature'],
    );
  }
}
