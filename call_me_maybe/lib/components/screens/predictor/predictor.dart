import 'package:flutter/material.dart';
import 'instructions.dart';
import 'prediction.dart';
import 'prompt.dart';
import '../../models/predictor_model.dart';

class Predictor extends StatefulWidget {

  @override
  _PredictorState createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {

  final predictorModel = PredictorModel();

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Prompt(prompt: 'Call Me...Maybe?'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () { setState( () {predictorModel.randomPrediction(); }); },
                child: Instructions(instructions: 'Ask a question...tap for the answer.'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Prediction(prediction: '${predictorModel.prediction}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}