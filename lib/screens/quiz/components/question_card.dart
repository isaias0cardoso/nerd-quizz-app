import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nerd_quizz_app/models/Questions.dart';
import 'package:nerd_quizz_app/models/questions.dart';

import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required Key key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: DefaultPadding),
      padding: EdgeInsets.all(DefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: BlackColor),
          ),
          SizedBox(height: DefaultPadding / 2),
          ...List.generate(
            question.options.length,
                (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index), key: UniqueKey(),
            ),
          ),
        ],
      ),
    );
  }
}
