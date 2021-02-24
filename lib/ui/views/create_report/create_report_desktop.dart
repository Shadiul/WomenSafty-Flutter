part of create_report_view;
class _CreateReportDesktop extends StatelessWidget {
  final CreateReportViewModel viewModel;
  _CreateReportDesktop(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CreateReportDesktop')),
    );
  }
}