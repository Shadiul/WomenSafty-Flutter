library registration_view;

import 'package:form_field_validator/form_field_validator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'registration_view_model.dart';
part 'registration_mobile.dart';
part 'registration_tablet.dart';
part 'registration_desktop.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
        viewModelBuilder: () => RegistrationViewModel(),
        onModelReady: (model) {
          // Do something once your model is initialized
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
            mobile: _RegistrationMobile(model),
            desktop: _RegistrationDesktop(model),
            tablet: _RegistrationTablet(model),
          );
        });
  }
}
