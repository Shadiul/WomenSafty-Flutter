part of create_report_view;

class _CreateReportMobile extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  final CreateReportViewModel viewModel;
  _CreateReportMobile(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Report'),
      ),
      drawer: DrawerView(
        selectedItem: DrawerItems.CREATE_REPORT,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: viewModel.dateController,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.calendar),
                  ),
                  labelText: 'Report date'),
              validator:
                  RequiredValidator(errorText: 'Report date This is required'),
              readOnly: true,
              onTap: () async {
                DateTime date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020, 1, 1),
                  lastDate: DateTime(2050, 1, 1),
                );
                if (date != null) {
                  viewModel.dateController.text =
                      DateFormat('yyyy-MM-dd').format(date);
                  viewModel.pickedTime = AppUtils.dateTimeToTimestamp(date);
                }
              },
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: viewModel.bloodPressureController,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.atom),
                  ),
                  labelText: 'Blood pressure',
                  suffixText: 'mmHg'),
              validator:
                  RequiredValidator(errorText: 'Blood pressure is required'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: viewModel.heartRateController,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.heartbeat),
                  ),
                  labelText: 'Heart rate',
                  suffixText: 'BPM'),
              validator: RequiredValidator(errorText: 'Heart rate is required'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: viewModel.temperatureController,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.thermometer),
                  ),
                  labelText: 'Temperature',
                  suffixText: 'F'),
              validator:
                  RequiredValidator(errorText: 'Temperature is required'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            scrollable: true,
                            content: Column(
                              children: [
                                Text('Please wait...'),
                                SizedBox(height: 8),
                                CircularProgressIndicator(),
                              ],
                            ),
                          );
                        },
                      );
                      viewModel.submitReport();
                    }
                  },
                  child: Text('SUBMIT'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
