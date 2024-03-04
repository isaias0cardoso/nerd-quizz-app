import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nerd_quizz_app/screens/quiz/components/buttons.dart';
import 'package:nerd_quizz_app/screens/quiz/quiz_screen.dart';

import '../../constants.dart';
import '../quiz/components/checkbox.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: BackgroundColor,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/logo.svg", width: 200),
                  SizedBox(height: 20),
                  PasswordTextField(
                    text: 'Email',
                    isPassword: false,
                    prefixIcon: Icon(Icons.mail),
                    suffixIcon: Icon(Icons.visibility_off),
                    suffixIconShow: false,
                  ),
                  SizedBox(height: 20),
                  PasswordTextField(
                    text: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                    isPassword: true,
                    suffixIconShow: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyCheckbox(),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    key: UniqueKey(),
                    text: 'Sign up',
                    onPress: () => Get.to(QuizScreen()),
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
