import 'package:flutter/material.dart';
import '../../models/predictor_model.dart';

class Predictor extends StatefulWidget {

  @override
  _PredictorState createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {

  @override
  Widget build(BuildContext context) {

    final predictorModel = PredictorModel();

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${predictorModel.prediction}'),
              GestureDetector(
                onTap: () { setState( () {predictorModel.randomPrediction(); }); },
                child: Text('text'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}