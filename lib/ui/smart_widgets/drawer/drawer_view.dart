import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:womensafty/core/enums.dart';
import 'package:womensafty/ui/smart_widgets/drawer/drawer_viewmodel.dart';

class DrawerView extends StatelessWidget {
  final DrawerItems selectedItem;

  const DrawerView({Key key, @required this.selectedItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
      builder: (context, model, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(model.patient.fullName),
              accountEmail: Text(model.patient.email),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.home),
              title: Text('Home'),
              selected: selectedItem == DrawerItems.HOME,
              onTap: selectedItem == DrawerItems.HOME
                  ? null
                  : model.navigateToHome,
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.userEdit),
              title: Text('Create Report'),
              selected: selectedItem == DrawerItems.CREATE_REPORT,
              onTap: selectedItem == DrawerItems.CREATE_REPORT
                  ? null
                  : model.navigateToCreateReport,
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.fileAlt),
              title: Text('All Reports'),
              selected: selectedItem == DrawerItems.ALL_REPORTS,
              onTap: selectedItem == DrawerItems.ALL_REPORTS
                  ? null
                  : model.navigateToAllReports,
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(FontAwesomeIcons.signOutAlt),
              title: Text('Logout'),
              selected: selectedItem == DrawerItems.LOGOUT,
              onTap: model.logout,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => DrawerViewModel(),
    );
  }
}
