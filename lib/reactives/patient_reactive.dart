import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:womensafty/core/locator.dart';
import 'package:womensafty/core/services/auth_service.dart';
import 'package:womensafty/core/services/firestore_service.dart';
import 'package:womensafty/models/patient.dart';

@lazySingleton
class PatientReactive with ReactiveServiceMixin {
  PatientReactive() {
    listenToReactiveValues([_patient, _isSignedIn]);
    getUid();
    autoSignIn();
  }
  final AuthService _authService = locator<AuthService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  RxValue<Patient> _patient = RxValue<Patient>(initial: null);
  Patient get patient => _patient.value;

  RxValue<String> _patientId = RxValue<String>(initial: '');
  String get patientId => _patientId.value;

  RxValue<bool> _isSignedIn = RxValue<bool>(initial: false);
  bool get isSignedIn => _isSignedIn.value;

  Future<void> registerUser(String email, String password, fullName) async {
    _patientId.value = await _authService.register(email, password);
    _patient.value = await _firestoreService.addPatient(
        uid: patientId, email: email, fullName: fullName);
  }

  Future<void> signInUser(String email, String password) async {
    _patientId.value = await _authService.signIn(email, password);
    _patient.value = await _firestoreService.fetchPatient(patientId);
  }

  void autoSignIn() async {
    if (_patientId.value.isNotEmpty) {
      _isSignedIn.value = true;
      _patient.value = await _firestoreService.fetchPatient(patientId);
    }
  }

  getUid() {
    if (_authService.checkSignIn()) _patientId.value = _authService.getUid();
  }

  Future<void> logout() async {
    await _authService.logout();
    _isSignedIn.value = _authService.checkSignIn();
  }
}
