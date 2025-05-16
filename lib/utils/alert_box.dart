import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:surveyapp/utils/colors.dart';

Future<void> alertBox(
  BuildContext context,
  String text,
  void Function() confirmFun,
  void Function() cancelFun,
) async {
  final colors = Colours();
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    onConfirmBtnTap: confirmFun,
    onCancelBtnTap: cancelFun,
    showCancelBtn: true,
    showConfirmBtn: true,
    customAsset: "assets/images/alertsurvey.jpg",
    widget: Text(
      text,
      style: GoogleFonts.balooTammudu2(
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    animType: QuickAlertAnimType.slideInUp,
  );
}
