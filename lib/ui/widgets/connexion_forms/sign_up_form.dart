import 'package:boujee/core/localization/app_localization.dart';
import 'package:boujee/core/services/form_validation.dart';
import 'package:boujee/ui/shared/buttons/default_raised_button.dart';
import 'package:boujee/ui/shared/default_textfield/default_textfield.dart';
import 'package:boujee/ui/shared/spacers/spacers.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final bool isLoading;
  final void Function(String email, String password, BuildContext context)
      registerUser;
  const SignUpForm({
    Key key,
    this.isLoading,
    this.registerUser,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userPassword = '';

  void _register() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.registerUser(
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalization.of(context);
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
                      labelText: localize?.translate('user_name') ?? '-',
                      validator: FormValidator.usernameValidation,
                      textInputType: TextInputType.emailAddress,
                      onSaved: (val) => _userEmail = val,
                    ),
                    const SpaceH16(),
                    DefaultTextField(
                      labelText: localize?.translate('email_adress') ?? '-',
                      validator: FormValidator.emailValidation,
                      textInputType: TextInputType.emailAddress,
                      onSaved: (val) => _userEmail = val,
                    ),
                    const SpaceH16(),
                    DefaultTextField(
                      labelText: localize?.translate('password') ?? '-',
                      validator: FormValidator.passwordValidation,
                      onSaved: (val) => _userPassword = val,
                      obscureText: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .12,
                ),
                DefaultRaisedButton(
                  onTap: _register,
                  text: localize?.translate('signUp') ?? '-',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
