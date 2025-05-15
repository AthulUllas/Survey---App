import 'package:flutter/material.dart';
import 'package:surveyapp/utils/appconstants.dart';
import 'package:http/http.dart' as http;
import 'package:surveyapp/utils/snackbar.dart';

class OtpVerifyService {
  final auth = Appconstants();

  Future<void> verifyOtp(String phone, String otp, BuildContext context) async {
    final url = Uri.parse("${auth.baseUrl}?mobile=$phone&otp=$otp");
    final response = await http.post(url);
    if (response.statusCode == 200) {
      snackBar(response.body, context);
    } else {
      snackBar(response.body, context);
    }
  }
}
