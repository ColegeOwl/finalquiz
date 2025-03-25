import 'package:finalquiz/data/questions.dart';
import 'package:finalquiz/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    //required this.onRestart
  });

  final List<String> chosenAnswers;
  //final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
  
  final summaryData = getSummaryData(); 

  final numTotalQuestions = questions.length;
  final numCorrectQuestions = summaryData.where(
    (data){
      return data['correct_answer'] == data['user_answer'];
    }
  ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('You answered $numCorrectQuestions out of $numTotalQuestions questions Correctly',style: TextStyle(fontSize: 24, color: Colors.orangeAccent) ,),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
                summaryData:
                    getSummaryData()), //Replaced with all the answers/questions
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: (){}, //onRestart
              child: const Text('Restart Quiz', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
