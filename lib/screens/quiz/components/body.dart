import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nerd_quizz_app/constants.dart';
import 'package:nerd_quizz_app/controllers/question_controller.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        Container(
          color: BackgroundColor,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
                child: ProgressBar(
                  key: key,
                ),
              ),
              SizedBox(height: DefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: 'Questão ${_questionController.questionNumber}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: SecondaryColor),
                      children: [
                        TextSpan(
                          text: '/${_questionController.questions.length}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: SecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1, color: Colors.white12),
              SizedBox(height: DefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                    key: UniqueKey(),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
