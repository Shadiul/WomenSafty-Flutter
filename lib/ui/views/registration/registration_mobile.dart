part of registration_view;

class _RegistrationMobile extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  final RegistrationViewModel viewModel;
  _RegistrationMobile(this.viewModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'password is required'),
                  EmailValidator(errorText: 'Enter a valid email address'),
                ]),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: viewModel.passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'password is required'),
                  MinLengthValidator(6,
                      errorText: 'password must be at least 8 digits long'),
                ]),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: viewModel.fullNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Full name is required'),
                ]),
              ),
              SizedBox(height: 8),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  OutlineButton(
                    onPressed: viewModel.navigateToSignIn,
                    child: Text('LOGIN'),
                  ),
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
                        viewModel.register();
                      }
                    },
                    child: Text('REGISTER'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
