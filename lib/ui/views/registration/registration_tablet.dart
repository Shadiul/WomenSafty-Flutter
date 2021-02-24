part of registration_view;
class _RegistrationTablet extends StatelessWidget {
  final RegistrationViewModel viewModel;
  _RegistrationTablet(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RegistrationTablet')),
    );
  }
}