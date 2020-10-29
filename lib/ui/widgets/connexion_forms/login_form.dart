import 'package:boujee/ui/constants/colors.dart';
import 'package:boujee/ui/shared/buttons/default_raised_button.dart';
import 'package:boujee/ui/shared/default_textfield/default_textfield.dart';
import 'package:boujee/ui/shared/spacers/spacers.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();

  void _login() {
    final _isValid = _formkey.currentState.validate();

    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextField(
                  labelText: 'Email address',
                  textInputType: TextInputType.emailAddress,
                ),
                const SpaceH16(),
                DefaultTextField(
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SpaceH16(),
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            DefaultRaisedButton(onTap: () {}, text: 'Login')
          ],
        ),
      ),
    );
  }
}
