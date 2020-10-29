import 'package:boujee/core/services/form_validation.dart';
import 'package:boujee/ui/shared/buttons/default_raised_button.dart';
import 'package:boujee/ui/shared/default_textfield/default_textfield.dart';
import 'package:boujee/ui/shared/spacers/spacers.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  void _register() {
    final _isValid = _formKey.currentState.validate();

    if (_isValid) {
      _formKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultTextField(
                      labelText: 'User name',
                      validator: FormValidator.usernameValidation,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SpaceH16(),
                    DefaultTextField(
                      labelText: 'Email address',
                      validator: FormValidator.emailValidation,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SpaceH16(),
                    DefaultTextField(
                      labelText: 'Password',
                      validator: FormValidator.passwordValidation,
                      obscureText: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .12,
                ),
                DefaultRaisedButton(onTap: _register, text: 'Sign-up'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
