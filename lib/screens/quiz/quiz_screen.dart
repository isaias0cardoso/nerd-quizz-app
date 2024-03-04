import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nerd_quizz_app/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  void resetQuiz() {
    Get.find<QuestionController>().reset();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: _controller.nextQuestion,
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Body(
        key: UniqueKey(),
      ),
    );
  }
}
