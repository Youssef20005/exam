import 'package:exam/Qustions.dart';

class app_brain {
  int _questionNumber = 0;
  List<Questions> _QuestionsGroub = [
    Questions(
        q: 'عدد الكواكب في المجموعه الشمسيه هو ثمانيه كواكب؟',
        i: 'assests/image-1.jpg',
        a: true),
    Questions(q: 'القطط هي حيوانات لاحمه', i: 'assests/image-2.jpg', a: true),
    Questions(
        q: 'الصين موجوده في القاره الافريقيه',
        i: 'assests/image-3.jpg',
        a: false),
    Questions(q: 'الارض مسطحه وليست كرويه', i: 'assests/image-4.jpg', a: false),
    Questions(
        q: 'باستطاعه الانسان ان يعيش بدون اكل',
        i: 'assests/image-5.jpg',
        a: true),
    Questions(
        q: 'الشمس تدور حول والارض تدور حول القمر',
        i: 'assests/image-6.jpg',
        a: false),
    Questions(
        q: 'الحيوانات لا تشعر بالالم', i: 'assests/image-7.jpg', a: false),
  ];

  void NextQu() {
    if (_questionNumber < _QuestionsGroub.length - 1) {
      _questionNumber++;
    }
  }

  String? getQuestiontext() {
    return _QuestionsGroub[_questionNumber].qustion;
  }

  String? getQuestionImage() {
    return _QuestionsGroub[_questionNumber].Image;
  }

  bool? getQuestiont_answer() {
    return _QuestionsGroub[_questionNumber].answer;
  }

  bool? isFinished() {
    if (_questionNumber >= _QuestionsGroub.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
