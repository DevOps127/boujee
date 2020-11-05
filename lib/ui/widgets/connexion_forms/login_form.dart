import 'package:boujee/core/localization/app_localization.dart';
import 'package:boujee/core/services/form_validation.dart';
import 'package:boujee/ui/constants/colors.dart';
import 'package:boujee/ui/shared/buttons/default_raised_button.dart';
import 'package:boujee/ui/shared/default_textfield/default_textfield.dart';
import 'package:boujee/ui/shared/spacers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  final bool isLoading;
  final void Function(String email, String password, BuildContext context)
      loginUser;
  const LoginForm({
    Key key,
    this.isLoading,
    this.loginUser,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();

  var _userEmail = '';
  var _userPassword = '';

  void _login() {
    final isValid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState.save();
      widget.loginUser(
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
          key: _formkey,
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
                      focusNode: _emailFocusNode,
                      validator: FormValidator.emailValidation,
                      labelText: localize?.translate('email_adress') ?? '-',
                      textInputType: TextInputType.emailAddress,
                      onSaved: (val) => _userEmail = val,
                    ),
                    const SpaceH16(),
                    DefaultTextField(
                      validator: FormValidator.passwordValidation,
                      labelText: localize?.translate('password') ?? '-',
                      obscureText: true,
                      onSaved: (val) => _userPassword = val,
                    ),
                    const SpaceH16(),
                    FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Text(
                        localize?.translate('forgot_password') ?? '-',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .14,
                ),
                SizedBox(
                  height: 16,
                ),
                DefaultRaisedButton(
                    onTap: _login, text: localize?.translate('login') ?? '-')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
