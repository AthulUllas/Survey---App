import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:surveyapp/features/auth/helper/helpers.dart';
import 'package:surveyapp/utils/appconstants.dart';
import 'package:surveyapp/utils/snackbar.dart';

class RegistrationService {
  final auth = Appconstants();
  final helper = Helpers();

  Future<void> registerUser(String phone, BuildContext context) async {
    try {
      // final bool canMessageSent;
      final url = Uri.parse("${auth.baseUrl}?mobile=$phone");
      final response = await http.post(url);
      if (response.statusCode == 200) {
        // canMessageSent = true;
        snackBar(response.body, context);
      } else {
        // canMessageSent = false;
        snackBar(response.body, context);
      }
      // final otp = helper.generateOtp();
      // final isMessageSent = helper.sendOtpThroughWhatsapp(otp, phone, context);
      // await (isMessageSent) ? canMessageSent = true : canMessageSent = false;
      // return canMessageSent;
    } catch (e) {
      snackBar(e.toString(), context);
    }
  }
}
