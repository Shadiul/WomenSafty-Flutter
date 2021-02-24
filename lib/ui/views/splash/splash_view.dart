library splash_view;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'splash_view_model.dart';
part 'splash_mobile.dart';
part 'splash_tablet.dart';
part 'splash_desktop.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (model) async {
          await model.autoSignIn();
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
            mobile: _SplashMobile(model),
            desktop: _SplashDesktop(model),
            tablet: _SplashTablet(model),
          );
        });
  }
}
