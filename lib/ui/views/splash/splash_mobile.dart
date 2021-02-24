part of splash_view;

class _SplashMobile extends StatelessWidget {
  final SplashViewModel viewModel;
  _SplashMobile(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Women Safty',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2,
      )),
    );
  }
}
