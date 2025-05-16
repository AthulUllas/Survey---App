import 'package:flutter/material.dart';
import 'package:surveyapp/utils/colors.dart';
import 'package:surveyapp/utils/dimensions.dart';

class SignUpTextfield extends StatelessWidget {
  const SignUpTextfield({
    super.key,
    required this.trailing,
    required this.textFieldHelper,
    required this.controller,
    required this.keyboardType,
  });

  final IconData trailing;
  final String textFieldHelper;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final colors = Colours();
    final sides = Dimensions();
    return Container(
      decoration: BoxDecoration(
        color: colors.textFieldColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 60,
      margin: EdgeInsets.only(left: sides.leftSide, right: sides.rightSide),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: sides.leftSide),
            child: Icon(trailing),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: textFieldHelper,
                contentPadding: EdgeInsets.only(left: sides.leftSide, top: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
