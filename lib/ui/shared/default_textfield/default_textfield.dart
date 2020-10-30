import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final bool obscureText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String Function(String value) validator;
  final void Function(String value) onSaved;
  const DefaultTextField({
    Key key,
    @required this.labelText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.focusNode,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
