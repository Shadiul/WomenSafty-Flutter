part of create_report_view;
class _CreateReportTablet extends StatelessWidget {
  final CreateReportViewModel viewModel;
  _CreateReportTablet(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CreateReportTablet')),
    );
  }
}