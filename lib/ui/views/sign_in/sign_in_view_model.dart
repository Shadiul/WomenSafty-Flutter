import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/route/router.gr.dart';
import 'package:womensafty/reactives/patient_reactive.dart';

class SignInViewModel extends ReactiveViewModel {
  SignInViewModel();
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_patientReactive];

  final PatientReactive _patientReactive = locator<PatientReactive>();
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn() async {
    await _patientReactive.signInUser(
        emailController.text, passwordController.text);
    _patientReactive.autoSignIn();
    if (_patientReactive.isSignedIn) {
      await navigateToHome();
    }
  }

  navigateToRegistration() async {
    await _navigationService.replaceWith(Routes.registrationView);
  }

  navigateToHome() async {
    await _navigationService.replaceWith(Routes.homeView);
  }
}
