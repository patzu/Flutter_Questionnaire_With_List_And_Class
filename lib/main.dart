import 'package:flutter/material.dart';
import 'package:i_am_rich/QuestionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> checkList = [];
  QuestionBank questionBank = QuestionBank();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
              ),
              Expanded(
                flex: 5,
                child: Text(
                  questionBank.getQuestion(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(true, context);
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(false, context);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    'No',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                children: checkList,
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkAnswer(bool userAnswer, BuildContext context) {
    if (questionBank.getCurrentQuestionIndex() <
        questionBank.getQuestionsLength() - 1) {
      if (questionBank.getAnswer() == userAnswer) {
        checkList.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        checkList.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      questionBank.nextQuestion();
    } else {
      questionBank.reset();
      checkList.clear();
      Alert(
        context: context,
        title: "Questionnaire is complete. ",
        desc: "you've finished the questionnaire successfully.",
        buttons: [
          DialogButton(
            height: 50,
            width: 100,
            child: Text(
              'Ok',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onPressed: () => {
              Navigator.pop(context),
            },
          )
        ],
      ).show();
    }
  }
}
