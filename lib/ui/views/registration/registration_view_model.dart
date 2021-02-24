import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/route/router.gr.dart';
import 'package:womensafty/reactives/patient_reactive.dart';

class RegistrationViewModel extends ReactiveViewModel {
  RegistrationViewModel();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_patientReactive];

  final PatientReactive _patientReactive = locator<PatientReactive>();
  final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  register() async {
    await _patientReactive.registerUser(
        emailController.text, passwordController.text, fullNameController.text);
    _patientReactive.autoSignIn();
    if (_patientReactive.isSignedIn) {
      await navigateToHome();
    }
  }

  navigateToSignIn() async {
    await _navigationService.replaceWith(Routes.signInView);
  }

  navigateToHome() async {
    await _navigationService.replaceWith(Routes.homeView);
  }
}
