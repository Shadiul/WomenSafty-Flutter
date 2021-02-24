library home_view;

import 'package:fl_chart/fl_chart.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:womensafty/core/enums.dart';
import 'package:womensafty/ui/smart_widgets/drawer/drawer_view.dart';
import 'home_view_model.dart';
part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {
          model.fetchChannel();
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
            mobile: _HomeMobile(model),
            desktop: _HomeDesktop(model),
            tablet: _HomeTablet(model),
          );
        });
  }
}
