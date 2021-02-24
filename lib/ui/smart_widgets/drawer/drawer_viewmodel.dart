import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/route/router.gr.dart';
import 'package:womensafty/models/patient.dart';
import 'package:womensafty/reactives/patient_reactive.dart';

class DrawerViewModel extends ReactiveViewModel {
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_patientReactive];

  final PatientReactive _patientReactive = locator<PatientReactive>();
  final NavigationService _navigationService = locator<NavigationService>();

  Patient get patient => _patientReactive.patient;

  Future<void> logout() async {
    await _patientReactive.logout();
    await _navigationService.clearStackAndShow(Routes.splashView);
  }

  navigateToHome() async {
    _navigationService.back();
    await Future.delayed(Duration(milliseconds: 200));
    await _navigationService.replaceWith(Routes.homeView);
  }

  navigateToCreateReport() async {
    _navigationService.back();
    await Future.delayed(Duration(milliseconds: 200));
    await _navigationService.replaceWith(Routes.createReportView);
  }

  navigateToAllReports() async {
    _navigationService.back();
    await Future.delayed(Duration(milliseconds: 200));
    await _navigationService.replaceWith(Routes.allReportsView);
  }
}
