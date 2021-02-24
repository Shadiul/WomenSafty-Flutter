import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/route/router.gr.dart';
import 'package:womensafty/reactives/patient_reactive.dart';

class SplashViewModel extends ReactiveViewModel {
  SplashViewModel();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_patientReactive];

  final PatientReactive _patientReactive = locator<PatientReactive>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future autoSignIn() async {
    await Future.delayed(Duration(milliseconds: 2000));
    _patientReactive.isSignedIn
        ? await _navigationService.replaceWith(Routes.homeView)
        : await _navigationService.replaceWith(Routes.signInView);
  }
}
