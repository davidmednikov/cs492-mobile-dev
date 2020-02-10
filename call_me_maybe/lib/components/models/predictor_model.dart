import 'dart:math';

class PredictorModel {

  final Random random = Random();
  static final List<String> answers = [
    'My sources say unlikely, but don\'t rule it out until tomorrow.',
    'If I had to bet a million dolllars, no. If I had to be a dollar, still no.',
    'There is a possibility that you have a chance at maybe getting called back.',
    '50 / 50 - They either call you, or they don\'t.',
    'I\'m...like...sensing positive vibes and energy from you major. You totally got this.',
    'I can\'t think for myself, some lousy dev created me. Why would you trust my opinion?',
    'I can say with utmost certainty that the company may call you back.',
    'As your predictor model, it is my duty to have one outcome that says yes.',
  ];

  String _prediction = answers[0];

  String get prediction => _prediction;

  void randomPrediction() {
    int index = random.nextInt(answers.length);
    _prediction = answers[index];
  }
}