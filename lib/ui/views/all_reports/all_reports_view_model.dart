import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/route/router.gr.dart';
import 'package:womensafty/models/report.dart';
import 'package:womensafty/reactives/report_reactive.dart';

class AllReportsViewModel extends ReactiveViewModel {
  AllReportsViewModel();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_reportReactive];

  final ReportReactive _reportReactive = locator<ReportReactive>();
  final NavigationService _navigationService = locator<NavigationService>();
  navigateToHome() async {
    await _navigationService.replaceWith(Routes.homeView);
  }

  List<Report> _reports = [];
  List<Report> get reports => _reports;

  void listenToReports() {
    setBusy(true);
    _reportReactive.streaReports().listen((reportsData) {
      List<Report> updatedReports = reportsData;
      if (updatedReports != null && updatedReports.length > 0) {
        _reports = updatedReports;
        notifyListeners();
      }
      setBusy(false);
    });
  }
}
