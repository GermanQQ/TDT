import 'package:flutter/material.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  const LoginForm(this._formKey,{required this.loginControler,required this.passwordControler});
  final TextEditingController loginControler;
  final TextEditingController passwordControler;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(hintText: 'user name', controller: loginControler),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: '*************',
            isPassword: true,
            controller: passwordControler,
          ),
        ],
      ),
    );
  }
}
