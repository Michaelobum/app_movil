import 'dart:io';

import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:classifier_rice/models/rice.dart';

class ClassifierRice {
  Future<Rice> getPrediction(File image) async {
    await Tflite.loadModel(
      model: 'assets/model/model.tflite',
      labels: 'assets/model/labels.txt',
    );
    var prediction = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    return Rice(prediction![0]['label'], prediction[0]['confidence']);
  }
}
