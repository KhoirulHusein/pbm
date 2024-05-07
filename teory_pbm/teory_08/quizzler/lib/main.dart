import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object quizBrain
QuizBrain quizBrain = QuizBrain();

// main Method
void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quiz Brain',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown.shade900,
        ),
        backgroundColor: Colors.brown,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List to save and store, displayed in Icon check or cross
  List<Icon> scoreKeeper = [];

  // Count True and False
  int numCorrect = 0;
  int numIncorrect = 0;

  // Track if the quiz is finished
  bool isFinished = false;

  // Function to check player's answers (parameter userPickedAnswer)
  // to answers from the list of questions(list questions/_questionBanks)
  void checkAnswer(bool userPickedAnswer) {
  bool correctAnswer = quizBrain.getCorrectAnswer();

  setState(() {
    if (quizBrain.isFinished() == true) {
      isFinished = true;
      quizBrain.reset();
      // Hitung skor terakhir
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(
          Icons.favorite,
          color: Color.fromARGB(255, 44, 201, 0),
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.favorite_border_outlined,
          color: Color.fromARGB(255, 168, 14, 0),
        ));
      }
      // Hitung total jawaban benar dan salah
      numCorrect = scoreKeeper.where((icon) => icon.icon == Icons.favorite).length;
      numIncorrect = scoreKeeper.where((icon) => icon.icon == Icons.favorite_border_outlined).length;

      showAlert(); // Tampilkan alert setelah perhitungan skor
      scoreKeeper = []; // Reset scoreKeeper setelah perhitungan skor
    } else {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(
          Icons.favorite,
          color: Color.fromARGB(255, 44, 201, 0),
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.favorite_border_outlined,
          color: Color.fromARGB(255, 168, 14, 0),
        ));
      }
      quizBrain.nextQuestion();
    }
  });
}


  // Function to show alert when quiz is finished
  void showAlert() {
    Alert(
      context: context,
      title: 'Finished',
      desc: 'Congratulations! You\'ve reached the end of the Quiz\n'
          'Correct Answers: $numCorrect\n'
          'Incorrect Answers: $numIncorrect\n'
          'Total Questions: ${quizBrain.getTotalQuestions()}',
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                isFinished ? 'Kuis Selesai' : quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        if (!isFinished)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: 20.0),
                  ),
                ),
                child: const Text(
                  "Benar",
                ),
              ),
            ),
          ),
        if (!isFinished)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  checkAnswer(false);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: 20.0),
                  ),
                ),
                child: const Text(
                  "Salah",
                ),
              ),
            ),
          ),
        if (isFinished)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isFinished = false; // Reset isFinished when user presses "Selesai"
                  });
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: 20.0),
                  ),
                ),
                child: const Text(
                  "Selesai",
                ),
              ),
            ),
          ),
        if (isFinished)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  showAlert(); // Show alert when user presses "Selesai"
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: 20.0),
                  ),
                ),
                child: const Text(
                  "Tampilkan Skor",
                ),
              ),
            ),
          ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
