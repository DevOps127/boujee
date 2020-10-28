import 'package:boujee/ui/shared/buttons/default_raised_button.dart';
import 'package:boujee/ui/shared/default_textfield/default_textfield.dart';
import 'package:boujee/ui/shared/spacers/spacers.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  textInputType: TextInputType.emailAddress,
                ),
                const SpaceH16(),
                DefaultTextField(
                  labelText: 'Email address',
                  textInputType: TextInputType.emailAddress,
                ),
                const SpaceH16(),
                DefaultTextField(
                  labelText: 'Password',
                  obscureText: true,
                ),
              ],
            ),
            Spacer(),
            DefaultRaisedButton(onTap: () {}, text: 'Sign-up'),
          ],
        ),
      ),
    );
  }
}
