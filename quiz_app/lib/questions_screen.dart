import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/questions/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  int currentQuestionIndex = 0;

  answerQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      print("DONE");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) => AnswerButton(answerText: answer, onTap: answerQuestion )),
          ],
        ),
      ),
    );
  }
}

// Container(
//       padding: const EdgeInsets.only(left: 40, right: 40),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'What are the main building blocks of Flutter UIs?',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color.fromARGB(144, 255, 255, 255),
//                 fontSize: 24,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Column(
//               children: [
//                 AnswerButton(answerText: 'answer 1', onTap: () {}),
//                 AnswerButton(answerText: 'answer 1', onTap: () {}),
//                 AnswerButton(answerText: 'answer 1', onTap: () {}),
//                 AnswerButton(answerText: 'answer 1', onTap: () {}),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );