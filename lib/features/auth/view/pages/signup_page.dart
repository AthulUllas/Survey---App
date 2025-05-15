import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surveyapp/features/auth/view/widgets/textfield.dart';
import 'package:surveyapp/utils/colors.dart';
import 'package:surveyapp/utils/dimensions.dart';
import 'package:surveyapp/utils/snackbar.dart';

class SignupPage extends HookWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showOtpButton = useState<bool>(true);
    final colors = Colours();
    final sides = Dimensions();
    return Scaffold(
      backgroundColor: colors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              "Welcome!",
              style: GoogleFonts.balooTammudu2(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            Text(
              "SignUp to your account",
              style: GoogleFonts.balooTammudu2(
                textStyle: TextStyle(color: colors.subTextColor, fontSize: 18),
              ),
            ),
            SignUpTextfield(
              trailing: AntDesign.user_outline,
              textFieldHelper: "UserName",
            ),
            SignUpTextfield(
              trailing: AntDesign.phone_outline,
              textFieldHelper: "Phone",
            ),
            (showOtpButton.value)
                ? TextButton(
                  onPressed: () async {
                    showOtpButton.value = false;
                    await Future.delayed(Duration(seconds: 3));
                    showOtpButton.value = true;
                    snackBar("Otp Sent", context);
                  },
                  child: Text("Get Otp", style: TextStyle(fontSize: 16)),
                )
                : LoadingAnimationWidget.newtonCradle(
                  color: colors.secondaryColor,
                  size: 70,
                ),
            SignUpTextfield(
              trailing: AntDesign.number_outline,
              textFieldHelper: "Enter Otp",
            ),
            Container(
              decoration: BoxDecoration(
                color: colors.secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              margin: EdgeInsets.only(
                left: sides.leftSide,
                right: sides.rightSide,
              ),
              child: Center(
                child: Text("Next", style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
