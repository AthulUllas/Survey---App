import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveyapp/utils/colors.dart';
import 'package:surveyapp/utils/dimensions.dart';

void snackBar(String message, BuildContext context) {
  final colors = Colours();
  final sides = Dimensions();
  final snackBar = SnackBar(
    content: Padding(
      padding: EdgeInsets.only(
        left: sides.snackBarLeftSide,
        top: sides.snackBarTopSide,
      ),
      child: Text(
        message,
        style: GoogleFonts.manjari(
          textStyle: TextStyle(color: colors.primaryTextColor, fontSize: 16),
        ),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    duration: Duration(seconds: 1),
    backgroundColor: colors.secondaryColor,
    showCloseIcon: true,
    closeIconColor: colors.primaryTextColor,
    margin: EdgeInsets.only(
      left: sides.leftSide,
      right: sides.rightSide,
      bottom: MediaQuery.of(context).size.height - 120,
    ),
  );
  final errorBar = ScaffoldMessenger.of(context);
  errorBar.showSnackBar(snackBar);
}

void hideSnackBar(BuildContext context) {
  final errorBar = ScaffoldMessenger.of(context);
  errorBar.hideCurrentSnackBar();
}
