import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surveyapp/features/homepage/views/pages/surveypage.dart';
import 'package:surveyapp/utils/colors.dart';
import 'package:surveyapp/utils/dimensions.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Colours();
    final sides = Dimensions();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/survey.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 56.0),
                  child: Text(
                    "Survey",
                    style: GoogleFonts.adventPro(
                      textStyle: TextStyle(
                        color: colors.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: sides.leftSide),
            child: Text(
              "Fill out the survey as soon as possible",
              style: GoogleFonts.manjari(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: colors.primaryTextColor,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: sides.leftSide),
                child: Text(
                  "Get ready for the survey",
                  style: GoogleFonts.manjari(
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: colors.primaryTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (route) => Surveypage()),
              );
            },
            child: Container(
              height: 65,
              margin: EdgeInsets.only(
                left: sides.leftSide,
                right: sides.rightSide,
              ),
              decoration: BoxDecoration(
                color: colors.secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Start",
                  style: GoogleFonts.notoSansModi(
                    textStyle: TextStyle(
                      color: colors.secondaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
