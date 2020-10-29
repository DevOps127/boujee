import 'package:boujee/core/services/form_validation.dart';
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
  final _emailFocusNode = FocusNode();

  void _login() {
    final _isValid = _formkey.currentState.validate();

    if (_isValid) {
      _formkey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.always,
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
                    focusNode: _emailFocusNode,
                    validator: FormValidator.emailValidation,
                    labelText: 'Email address',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SpaceH16(),
                  DefaultTextField(
                    validator: FormValidator.passwordValidation,
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
              DefaultRaisedButton(onTap: _login, text: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}
