import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:womensafty/core/app_utils.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/services/auth_service.dart';
import 'package:womensafty/core/services/firestore_service.dart';
import 'package:womensafty/models/report.dart';

@lazySingleton
class ReportReactive with ReactiveServiceMixin {
  ReportReactive() {
    listenToReactiveValues([_reports, _patientId]);
    getUid();
  }
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();

  RxValue<Map<String, Report>> _reports =
      RxValue<Map<String, Report>>(initial: Map<String, Report>());
  Map<String, Report> get reports => _reports.value;

  RxValue<String> _patientId = RxValue<String>(initial: '');
  String get patientId => _patientId.value;

  Future<void> createReport({
    Timestamp timestamp,
    double bloodPreassure,
    double heartRate,
    double temperature,
  }) async {
    String id = await _firestoreService.createReport(
      uid: patientId,
      timestamp: timestamp,
      bloodPreassure: bloodPreassure,
      heartRate: heartRate,
      temperature: temperature,
    );

    Report _report = Report(
      id: id,
      timestamp: AppUtils.timestampToString(timestamp),
      bloodPreassure: bloodPreassure,
      heartRate: heartRate,
      temperature: temperature,
    );

    _reports.value[id] = _report;
  }

  getUid() {
    if (_authService.checkSignIn()) _patientId.value = _authService.getUid();
  }

  final StreamController<List<Report>> _reportsController =
      StreamController<List<Report>>.broadcast();

  Stream<List<Report>> streaReports() {
    _firestoreService.streaReports(patientId).listen((QuerySnapshot snapshots) {
      if (snapshots.docs.isNotEmpty) {
        List<Report> reports = snapshots.docs
            .map((QueryDocumentSnapshot snapshot) =>
                Report.fromSnapshot(snapshot))
            .toList();

        _reportsController.add(reports);
      }
    });

    return _reportsController.stream;
  }
}
