import 'package:i_am_rich/Question.dart';

class QuestionBank {
  int _questionNumber = 0;

  List<Question> _questionList = [
    Question(
      question: 'Are you After the the age of 30?',
      answer: true,
    ),
    Question(
      question: 'Are you married?',
      answer: false,
    ),
    Question(
      question: 'Do you own any pet?',
      answer: true,
    ),
  ];

  void nextQuestion() {
      _questionNumber++;
  }

  int getCurrentQuestionIndex() {
    return _questionNumber;
  }

  void reset() {
    _questionNumber = 0;
  }

  String getQuestion() {
    return _questionList[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionList[_questionNumber].answer;
  }

  int getQuestionsLength() {
    return _questionList.length.toInt();
  }
}
