import 'dart:math';

class PredictorModel {

  final Random random = Random();
  static final List<String> answers = [
    'MY SOURCES SAY UNLIKELY, BUT DON\'T RULE IT OUT UNTIL TOMORROW.',
    'IF I HAD TO BET A MILLION DOLLLARS, NO. IF I HAD TO BE A DOLLAR, STILL NO.',
    'THERE IS A POSSIBILITY THAT YOU HAVE A CHANCE AT MAYBE GETTING CALLED BACK.',
    '50 / 50 - THEY EITHER CALL YOU, OR THEY DON\'T.',
    'I\'M...LIKE...SENSING POSITIVE VIBES AND ENERGY FROM YOU MAJOR. YOU TOTALLY GOT THIS.',
    'I CAN\'T THINK FOR MYSELF, SOME LOUSY DEV CREATED ME. WHY WOULD YOU TRUST MY OPINION?',
    'I CAN SAY WITH UTMOST CERTAINTY THAT THE COMPANY MAY CALL YOU BACK.',
    'AS YOUR PREDICTOR MODEL, IT IS MY DUTY TO HAVE ONE OUTCOME THAT SAYS YES.',
  ];

  String _prediction = answers[0];

  String get prediction => _prediction;

  void randomPrediction() {
    int index = random.nextInt(answers.length);
    _prediction = answers[index];
  }
}