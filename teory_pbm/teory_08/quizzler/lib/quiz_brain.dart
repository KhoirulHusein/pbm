import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Benar atau Salah? 2 + 2 = 4', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 10 - 5 = 3', questionAnswer: false),
    Question(questionText: 'Benar atau Salah? 6 * 3 = 18', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 15 / 3 = 5', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 8 + 4 = 11', questionAnswer: false),
    Question(questionText: 'Benar atau Salah? 20 - 8 = 12', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 7 * 2 = 14', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 25 / 5 = 6', questionAnswer: false),
    Question(questionText: 'Benar atau Salah? 3 + 6 = 9', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 12 - 7 = 6', questionAnswer: false),
    Question(questionText: 'Benar atau Salah? 4 * 5 = 20', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 30 / 6 = 4', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 3 + 5 = 8', questionAnswer: true),
    Question(questionText: 'Benar atau Salah? 10 - 4 = 5', questionAnswer: false),
    Question(questionText: 'Benar atau Salah? 2 * 6 = 12', questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1 ) {
      // ignore: avoid_print
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  int getTotalQuestions() {
    return _questionBank.length;
  }
  
  void reset() {
    _questionNumber = 0;
  }
}