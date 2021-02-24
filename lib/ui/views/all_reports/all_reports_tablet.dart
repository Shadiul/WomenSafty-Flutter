part of all_reports_view;
class _AllReportsTablet extends StatelessWidget {
  final AllReportsViewModel viewModel;
  _AllReportsTablet(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AllReportsTablet')),
    );
  }
}