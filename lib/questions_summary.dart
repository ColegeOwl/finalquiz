import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            Color cirColor;
            if (data['user_answer'] == data['correct_answer']) {
              cirColor = Colors.green; 
            } else {
              cirColor = Colors.red;  
            }

            return Row(
              children: [
                // Circle for question_index with dynamic color
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cirColor, // Use circleColor here
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Space between circle and text
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Your answer: ${data['user_answer'] as String}',
                        style: const TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Right Answer: ${data['correct_answer'] as String}',
                        style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}