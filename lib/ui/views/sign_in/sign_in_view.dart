library sign_in_view;

import 'package:form_field_validator/form_field_validator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'sign_in_view_model.dart';
part 'sign_in_mobile.dart';
part 'sign_in_tablet.dart';
part 'sign_in_desktop.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        onModelReady: (model) {
          // Do something once your model is initialized
        },
        builder: (context, model, child) {
          return ScreenTypeLayout(
            mobile: _SignInMobile(model),
            desktop: _SignInDesktop(model),
            tablet: _SignInTablet(model),
          );
        });
  }
}
