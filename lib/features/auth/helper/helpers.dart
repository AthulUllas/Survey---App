import 'dart:math';

import 'package:flutter/material.dart';
import 'package:surveyapp/utils/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  Future<bool> sendOtpThroughWhatsapp(
    String otp,
    String phone,
    BuildContext context,
  ) async {
    final bool isMessageSent;
    final message = "Your 6 digit otp is $otp";
    final url = Uri.parse(
      "https://wa.me/+91$phone?text=${Uri.encodeFull(message)}",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
      isMessageSent = true;
    } else {
      hideSnackBar(context);
      snackBar(message, context);
      isMessageSent = false;
    }
    return isMessageSent;
  }

  String generateOtp() {
    final random = Random();
    final otpInt = random.nextInt(900000) + 100000;
    final otp = otpInt.toString();
    return otp;
  }
}
