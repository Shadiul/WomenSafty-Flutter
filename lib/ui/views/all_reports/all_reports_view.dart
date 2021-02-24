library all_reports_view;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:womensafty/core/enums.dart';
import 'package:womensafty/models/report.dart';
import 'package:womensafty/ui/smart_widgets/drawer/drawer_view.dart';
import 'all_reports_view_model.dart';
part 'all_reports_mobile.dart';
part 'all_reports_tablet.dart';
part 'all_reports_desktop.dart';

class AllReportsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllReportsViewModel>.reactive(
        viewModelBuilder: () => AllReportsViewModel(),
        onModelReady: (model) {
          model.listenToReports();
        },
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: () async {
              model.navigateToHome();
              return false;
            },
            child: ScreenTypeLayout(
              mobile: _AllReportsMobile(model),
              desktop: _AllReportsDesktop(model),
              tablet: _AllReportsTablet(model),
            ),
          );
        });
  }
}
