import 'package:firebase_core/firebase_core.dart';
import 'package:stacked_services/stacked_services.dart';
import 'core/locator.dart';
import 'package:flutter/material.dart';
import 'core/route/router.gr.dart' as r;

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      navigatorKey: StackedService.navigatorKey,
      // home: SignInView(),
      initialRoute: r.Routes.splashView,
      onGenerateRoute: r.Router().onGenerateRoute,
    );
  }
}
