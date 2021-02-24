// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/views/all_reports/all_reports_view.dart';
import '../../ui/views/create_report/create_report_view.dart';
import '../../ui/views/home/home_view.dart';
import '../../ui/views/registration/registration_view.dart';
import '../../ui/views/sign_in/sign_in_view.dart';
import '../../ui/views/splash/splash_view.dart';

class Routes {
  static const String allReportsView = '/all-reports-view';
  static const String createReportView = '/create-report-view';
  static const String splashView = '/splash-view';
  static const String signInView = '/sign-in-view';
  static const String registrationView = '/registration-view';
  static const String homeView = '/home-view';
  static const all = <String>{
    allReportsView,
    createReportView,
    splashView,
    signInView,
    registrationView,
    homeView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.allReportsView, page: AllReportsView),
    RouteDef(Routes.createReportView, page: CreateReportView),
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.registrationView, page: RegistrationView),
    RouteDef(Routes.homeView, page: HomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AllReportsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AllReportsView(),
        settings: data,
      );
    },
    CreateReportView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateReportView(),
        settings: data,
      );
    },
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    SignInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInView(),
        settings: data,
      );
    },
    RegistrationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegistrationView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
  };
}
