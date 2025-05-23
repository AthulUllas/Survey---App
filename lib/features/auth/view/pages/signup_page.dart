import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surveyapp/features/auth/view/widgets/textfield.dart';
import 'package:surveyapp/features/homepage/views/pages/homepage.dart';
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
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final otpController = useTextEditingController();
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
              controller: nameController,
              trailing: AntDesign.user_outline,
              textFieldHelper: "UserName",
              keyboardType: TextInputType.name,
            ),
            Container(
              decoration: BoxDecoration(
                color: colors.textFieldColor,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 60,
              margin: EdgeInsets.only(
                left: sides.leftSide,
                right: sides.rightSide,
              ),
              child: Row(
                children: [
                  CountryCodePicker(
                    onInit: (value) {
                      phoneController.text = "+1 ";
                    },
                    onChanged: (value) {
                      phoneController.clear();
                      phoneController.text =
                          value.dialCode! + phoneController.text;
                    },
                    initialSelection: "US",
                    favorite: ['+91', 'IN'],
                    closeIcon: Icon(AntDesign.close_outline),
                    showOnlyCountryWhenClosed: true,
                    flagWidth: 25,
                    padding: EdgeInsets.only(left: 6),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    decoration: BoxDecoration(color: colors.borderColor),
                  ),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                        contentPadding: EdgeInsets.only(left: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 45,
                    width: 45,
                    child: Center(child: Brand(Brands.google)),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 45,
                    width: 45,
                    child: Center(child: Brand(Brands.apple_logo)),
                  ),
                ),
              ],
            ),
            (showOtpButton.value)
                ? TextButton(
                  onPressed: () async {
                    showOtpButton.value = false;
                    await Future.delayed(Duration(milliseconds: 1500));
                    showOtpButton.value = true;
                    snackBar("Otp Sent", context);
                  },
                  child: Text("Get Otp", style: TextStyle(fontSize: 16)),
                )
                : LoadingAnimationWidget.waveDots(
                  color: colors.secondaryColor,
                  size: 30,
                ),
            SignUpTextfield(
              controller: otpController,
              trailing: AntDesign.number_outline,
              textFieldHelper: "Enter Otp",
              keyboardType: TextInputType.phone,
            ),
            GestureDetector(
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty &&
                    otpController.text.isNotEmpty) {
                  if (phoneController.text.length < 13) {
                    snackBar("Phone field is wrong", context);
                  } else if (otpController.text.length < 4) {
                    snackBar("Otp is wrong", context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (route) => Homepage()),
                    );
                    nameController.clear();
                    phoneController.clear();
                    otpController.clear();
                  }
                } else {
                  snackBar("Empty column", context);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: colors.secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colors.borderColor,
                      blurRadius: 3,
                      spreadRadius: 0.2,
                    ),
                  ],
                ),
                height: 50,
                margin: EdgeInsets.only(
                  left: sides.leftSide,
                  right: sides.rightSide,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.balooTammudu2(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          ],
        ),
      ),
    );
  }
}
