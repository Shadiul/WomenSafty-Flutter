// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../reactives/patient_reactive.dart' as _i6;
import '../reactives/report_reactive.dart' as _i7;
import 'services/auth_service.dart' as _i3;
import 'services/firestore_service.dart' as _i5;
import 'services/third_party_services.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
  gh.factory<_i4.DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i5.FirestoreService>(() => _i5.FirestoreService());
  gh.factory<_i4.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i6.PatientReactive>(() => _i6.PatientReactive());
  gh.lazySingleton<_i7.ReportReactive>(() => _i7.ReportReactive());
  gh.factory<_i4.SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  return get;
}

class _$ThirdPartyServicesModule extends _i8.ThirdPartyServicesModule {
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackbarService => _i4.SnackbarService();
}
