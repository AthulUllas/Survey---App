import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future<void> alertBox(
  BuildContext context,
  String confirmText,
  String cancelButtonText,
  void Function() confirmFun,
  void Function() cancelFun,
) async {
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    confirmBtnText: confirmText,
    cancelBtnText: cancelButtonText,
    onConfirmBtnTap: confirmFun,
    onCancelBtnTap: cancelFun,
    showCancelBtn: true,
    showConfirmBtn: true,
  );
}
