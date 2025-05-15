import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:surveyapp/utils/alert_box.dart';
import 'package:surveyapp/utils/colors.dart';
import 'package:surveyapp/utils/dimensions.dart';

class Surveypage extends HookConsumerWidget {
  const Surveypage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sides = Dimensions();
    final colors = Colours();
    final myList = [
      "The survey question will appear here",
      "This is your question to answer",
      "The survey question appears here",
      "The question shows here is dynamic",
      "Answer this question from the options",
      "Select your answer from below",
    ];
    final options = [
      "Option 1",
      "Option 2",
      "Option 3",
      "Option 4",
      "Option 5",
      "Option 6",
      "Option 7",
    ];
    var currentQuestion = useState(1);
    final selectedIndex = useState<int?>(null);
    return Scaffold(
      backgroundColor: colors.secondaryTextColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(color: colors.primaryColor),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: sides.topSide),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (currentQuestion.value > 1 &&
                                currentQuestion.value <= myList.length) {
                              currentQuestion.value--;
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: sides.leftSide),
                            child: Row(
                              children: [
                                Icon(AntDesign.left_outline),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "Back",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            "${currentQuestion.value} of ${myList.length}",
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: sides.rightSide),
                          child: IconButton(
                            icon: Icon(AntDesign.close_outline, size: 18),
                            onPressed: () {
                              alertBox(
                                context,
                                "Confirm",
                                "Cancel",
                                () {
                                  Navigator.pop(context);
                                },
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: sides.leftSide,
                            right: sides.rightSide,
                            top: sides.topSide,
                          ),
                          child: LinearProgressBar(
                            backgroundColor: colors.secondaryTextColor,
                            progressColor: colors.progressBarProgressColor,
                            maxSteps: myList.length,
                            currentStep: currentQuestion.value,
                            borderRadius: BorderRadius.circular(10),
                            minHeight: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: sides.topSide,
                          left: sides.leftSide,
                          right: sides.rightSide,
                        ),
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Text(
                            myList[currentQuestion.value - 1],
                            key: ValueKey<int>(currentQuestion.value),
                            softWrap: true,
                            style: GoogleFonts.manjari(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: colors.primaryTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: sides.leftSide,
                          top: sides.topSide,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "The condition will show here",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manjari(
                                textStyle: TextStyle(
                                  color: colors.subTextColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: sides.bottomSide),
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () {
                        selectedIndex.value = index;
                      },
                      child: Container(
                        height: 90,
                        margin: EdgeInsets.only(
                          left: sides.leftSide,
                          right: sides.rightSide,
                          top: sides.topSide,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? colors.primaryColor
                                  : colors.secondaryTextColor,
                          border: Border.all(
                            color:
                                isSelected
                                    ? colors.progressBarProgressColor
                                    : colors.borderColor,
                            width: isSelected ? 2 : 0.5,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: sides.leftSide),
                              child: Text(
                                options[index],
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: sides.rightSide),
                              child: Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: isSelected,
                                  onChanged: (value) {
                                    selectedIndex.value = index;
                                  },
                                  shape: CircleBorder(),
                                  side: BorderSide(
                                    color:
                                        isSelected
                                            ? colors.progressBarProgressColor
                                            : colors.borderColor,
                                  ),
                                  activeColor: colors.primaryColor,
                                  checkColor: colors.progressBarProgressColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (currentQuestion.value < myList.length) {
                  currentQuestion.value++;
                }
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
                  boxShadow: [
                    BoxShadow(
                      color: colors.borderColor,
                      blurRadius: 3,
                      spreadRadius: 0.2,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Next Question",
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
      ),
    );
  }
}
