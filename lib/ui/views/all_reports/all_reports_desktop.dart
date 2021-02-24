part of all_reports_view;
class _AllReportsDesktop extends StatelessWidget {
  final AllReportsViewModel viewModel;
  _AllReportsDesktop(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AllReportsDesktop')),
    );
  }
}