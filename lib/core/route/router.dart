import 'package:auto_route/auto_route_annotations.dart';
import '../../ui/views/all_reports/all_reports_view.dart';
import '../../ui/views/create_report/create_report_view.dart';
import '../../ui/views/splash/splash_view.dart';
import '../../ui/views/sign_in/sign_in_view.dart';
import '../../ui/views/registration/registration_view.dart';
import '../../ui/views/home/home_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: AllReportsView,
    ),
    MaterialRoute(
      page: CreateReportView,
    ),
    MaterialRoute(
      page: SplashView,
    ),
    MaterialRoute(
      page: SignInView,
    ),
    MaterialRoute(
      page: RegistrationView,
    ),
    MaterialRoute(
      page: HomeView,
    ),
    // initial route is named "/"
    //MaterialRoute(page: HomeView, initial: true)
  ],
)
class $Router {}
