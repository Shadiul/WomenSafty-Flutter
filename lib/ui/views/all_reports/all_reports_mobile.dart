part of all_reports_view;

class _AllReportsMobile extends StatelessWidget {
  final AllReportsViewModel viewModel;
  _AllReportsMobile(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reports'),
      ),
      drawer: DrawerView(
        selectedItem: DrawerItems.ALL_REPORTS,
      ),
      body: viewModel.isBusy
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: viewModel.reports.length,
              itemBuilder: (context, index) {
                Report report = viewModel.reports[index];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.circle,
                              size: 32,
                            ),
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                report.timestamp,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.atom),
                                      SizedBox(width: 8),
                                      Text(report.bloodPreassure.toString()),
                                    ],
                                  )),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.heartbeat),
                                      SizedBox(width: 8),
                                      Text(report.heartRate.toString()),
                                    ],
                                  )),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.temperatureHigh),
                                      SizedBox(width: 8),
                                      Text(report.temperature.toString()),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 2,
                indent: 64,
              ),
            ),
    );
  }
}
