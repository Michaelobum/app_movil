import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:classifier_rice/models/rice.dart';

class ShowPrediction extends StatelessWidget {
  final Rice? _diseaseTomatoLeaf;
  const ShowPrediction(this._diseaseTomatoLeaf, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_diseaseTomatoLeaf != null) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            padding: const EdgeInsets.all(8),
            child: Text('Predicción: ${_diseaseTomatoLeaf!.label}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                )),
          ),
          const Gap(12),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.green),
            padding: const EdgeInsets.all(8),
            child: Text('Confianza: ${_diseaseTomatoLeaf!.confidencePercent}%',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          ),
        ],
      );
    }
    return Container();
  }
}
