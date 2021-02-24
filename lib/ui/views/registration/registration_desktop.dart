part of registration_view;
class _RegistrationDesktop extends StatelessWidget {
  final RegistrationViewModel viewModel;
  _RegistrationDesktop(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RegistrationDesktop')),
    );
  }
}