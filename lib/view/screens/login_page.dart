import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/view_models/auth_model.dart';
import 'package:flutter_tdt/view/widgets/snackbar.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.login,
      key: ValueKey(Routes.login),
      child: const LoginPage(),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginControler = TextEditingController();
  final _passwordControler = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginControler.dispose();
    _passwordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select(((AuthModel value) => value.statusAuth));
    final error = context.select(((AuthModel value) => value.error));

    if (status == AuthStatus.Failed && error != null) {
      Future.delayed(const Duration(milliseconds: 200),
          () => showSnackBar(context, text: error));
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: status == AuthStatus.Authenticating
            ? const SplashWidget()
            : Center(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const LogoImage(width: 75, height: 75),
                        const SizedBox(height: 40),
                        Text('Welcome back! \na Sign in to continue!',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center),
                        const SizedBox(height: 40),
                        LoginForm(
                          _formKey,
                          loginControler: _loginControler,
                          passwordControler: _passwordControler,
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                            title: 'Log in',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await context.read<AuthModel>().onPressSignIn(
                                    _loginControler.text,
                                    _passwordControler.text);
                              }
                            }),
                        const SizedBox(height: 20),
                        CustomButton(
                            title: 'Forgot password',
                            onPressed: () {},
                            type: ButtonType.white),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
