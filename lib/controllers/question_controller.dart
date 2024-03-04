import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nerd_quizz_app/models/questions.dart';
import '../screens/score_screen/score_screen.dart';

class QuestionController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late PageController _pageController;

  final List<Question> _questions = sample_data.map((question) {
    return Question(
      id: question['id'],
      question: question['question'],
      options: question['options'],
      answer: question['answer_index'],
    );
  }).toList();

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns = 0;
  late int _selectedAns;
  RxInt _questionNumber = 1.obs;
  int _numOfCorrectAns = 0;

  @override
  void onInit() {
    _animationController = AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() => update());

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {

    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), nextQuestion);
  }

  void nextQuestion() {
    if (_questionNumber.value < _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  List<Question> get questions => _questions;
  Animation<double> get animation => _animation;
  PageController get pageController => _pageController;
  int get correctAns => _correctAns;
  int get selectedAns => _selectedAns;
  int get numOfCorrectAns => _numOfCorrectAns;
  int get questionNumber => _questionNumber.value;

  void reset() {
    _questionNumber.value = 1;
    _numOfCorrectAns = 0;
    _isAnswered = false;
    _pageController.jumpToPage(0);
  }

}