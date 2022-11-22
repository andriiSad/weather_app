import 'package:flutter/material.dart';

import '../../constants/my_constants.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  @override
  Widget build(BuildContext context) {
    final questionsAnswers = MyConstants.of(context)!.questionsAnswers;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            MyConstants.of(context)!.faqSectionName,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        ...questionsAnswers.entries.map((entry) {
          return QuestionAnswerWidget(question: entry.key, answer: entry.value);
        }).toList()
      ],
    );
  }
}

class QuestionAnswerWidget extends StatefulWidget {
  const QuestionAnswerWidget({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);
  final String question;
  final String answer;

  @override
  State<QuestionAnswerWidget> createState() => _QuestionAnswerWidgetState();
}

class _QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.question,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  !_isExpanded
                      ? const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.black,
                        )
                ],
              ),
            ),
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.answer,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 1.7,
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
