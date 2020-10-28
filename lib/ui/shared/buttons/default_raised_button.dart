import 'package:boujee/ui/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultRaisedButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  const DefaultRaisedButton({
    Key key,
    @required this.onTap,
    @required this.text,
    this.textColor = AppColors.colorWhite,
    this.backgroundColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
