import 'package:flutter/material.dart';
import 'package:i_am_rich/Question.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> checkList = [];
  int i = 0;
  List<Question> questionList = [
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
    Question(
      question: 'Done.',
      answer: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    questionList[i].question,
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
                      setState(
                        () {
                          if (i < 3) {
                            if (questionList[i].answer == true) {
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
                            i++;
                          }
                        },
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
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
                      setState(
                        () {
                          if (i < 3) {
                            if (questionList[i].answer == false) {
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
                            i++;
                          }
                        },
                      );
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
      ),
    );
  }
}
