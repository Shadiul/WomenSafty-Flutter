library create_report_view;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:womensafty/core/app_utils.dart';
import 'package:womensafty/core/enums.dart';
import 'package:womensafty/ui/smart_widgets/drawer/drawer_view.dart';
import 'create_report_view_model.dart';
part 'create_report_mobile.dart';
part 'create_report_tablet.dart';
part 'create_report_desktop.dart';

class CreateReportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateReportViewModel>.reactive(
        viewModelBuilder: () => CreateReportViewModel(),
        onModelReady: (model) {
          // Do something once your model is initialized
        },
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: () async {
              model.navigateToHome();
              return false;
            },
            child: ScreenTypeLayout(
              mobile: _CreateReportMobile(model),
              desktop: _CreateReportDesktop(model),
              tablet: _CreateReportTablet(model),
            ),
          );
        });
  }
}
