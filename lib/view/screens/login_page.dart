import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/view_models/login_model.dart';
import 'package:flutter_tdt/view/widgets/snackbar.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.login,
      key: ValueKey(Routes.login),
      child: LoginPage(),
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
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => LoginModel(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Consumer<LoginModel>(builder: (context, model, child) {
            return model.status == ViewState.Idle
                ? Center(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const LogoImage(),
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
                                    final _status = await model.login(
                                        _loginControler.text,
                                        _passwordControler.text);
                                    if (_status != AuthStatus.Authenticated) {
                                      Future.delayed(
                                          Duration(milliseconds: 200),
                                          () => showSnackBar(context,
                                              text: 'Wrong login or password'));
                                    }
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
                  )
                : const InfinityZoomImage();
          }),
        ),
      ),
    );
  }
}
