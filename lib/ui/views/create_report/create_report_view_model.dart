import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/route/router.gr.dart';
import 'package:womensafty/reactives/report_reactive.dart';

class CreateReportViewModel extends ReactiveViewModel {
  CreateReportViewModel();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_reportReactive];

  final ReportReactive _reportReactive = locator<ReportReactive>();
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController dateController = TextEditingController();
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();

  Timestamp pickedTime;

  Future<void> submitReport() async {
    await _reportReactive.createReport(
      timestamp: pickedTime,
      bloodPreassure: double.parse(bloodPressureController.text),
      heartRate: double.parse(heartRateController.text),
      temperature: double.parse(temperatureController.text),
    );

    _navigationService.back();
  }

  navigateToHome() async {
    await _navigationService.replaceWith(Routes.homeView);
  }
}
