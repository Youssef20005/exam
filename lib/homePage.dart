import 'package:exam/Qustions.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'app_brain.dart';

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'اختبار',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ExamApp(),
      ),
    );
  }
}

class ExamApp extends StatefulWidget {
  @override
  State<ExamApp> createState() => _ExamAppState();
}

class _ExamAppState extends State<ExamApp> {
  app_brain App = app_brain();
  List<Widget> answer = [];

  void check_answer(bool answer_backed) {
    bool CorrectAnswer = App.getQuestiont_answer()!;

    setState(() {
      if (answer_backed == CorrectAnswer) {
        answer.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
      } else {
        answer.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (App.isFinished() == true) {
        Alert(
          context: context,
          title: "انتهاء الاختبار ",
          desc: "لقد اجبت علي كل الاسئله",
          buttons: [
            DialogButton(
              child: Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        App.reset();
        answer = [];
      } else {
        App.NextQu();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: answer),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                Image.asset(App.getQuestionImage()!),
                SizedBox(
                  height: 20,
                ),
                Text(
                  App.getQuestiontext()!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ],
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () {
                  check_answer(true);
                },
                child: Text(
                  'صح',
                  style: TextStyle(fontSize: 22),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                onPressed: () {
                  check_answer(false);
                },
                child: Text(
                  'خطأ',
                  style: TextStyle(fontSize: 22),
                )),
          ),
        ),
      ],
    );
  }
}
