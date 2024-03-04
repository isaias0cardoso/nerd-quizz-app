import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nerd_quizz_app/constants.dart';
import 'package:nerd_quizz_app/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nerd_quizz_app/screens/login_screen.dart/login_screen.dart';

import '../quiz/components/buttons.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: BackgroundColor,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(DefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/logo.svg", width: 200),
                  SizedBox(height: DefaultPadding),
                  Text(
                    "Score",
                    style: TextStyle(
                        fontSize: 40,
                        color: SecondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}',
                    style: TextStyle(
                        fontSize: 24,
                        color: SecondaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: DefaultPadding),
                  //Buttons
                  Column(
                    children: [
                      PrimaryButton(
                        key: UniqueKey(),
                        text: 'Play again',
                        onPress: () {
                          _qnController.reset();
                          Get.back();
                        },
                      ),
                      SizedBox(height: 20),
                      SecondaryButton(
                        key: UniqueKey(),
                        text: 'Logout',
                        onPress: () {
                          _qnController.reset();
                          Get.offAll(LoginScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
