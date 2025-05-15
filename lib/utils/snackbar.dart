import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveyapp/utils/colors.dart';
import 'package:surveyapp/utils/dimensions.dart';

Future<void> snackBar(String message, BuildContext context) async {
  final colors = Colours();
  final sides = Dimensions();
  showFlash(
    context: context,
    duration: Duration(seconds: 1),
    builder: (context, controller) {
      return FlashBar(
        controller: controller,
        content: Center(
          child: Padding(
            padding: EdgeInsets.only(top: sides.snackBarTopSide),
            child: Text(message),
          ),
        ),
        contentTextStyle: GoogleFonts.manjari(
          textStyle: TextStyle(
            fontSize: 18,
            color: colors.progressBarProgressColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        position: FlashPosition.top,
        behavior: FlashBehavior.floating,
        margin: EdgeInsets.only(
          left: sides.leftSide,
          right: sides.rightSide,
          top: sides.topSide,
        ),
        backgroundColor: colors.primaryTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      );
    },
  );
}
