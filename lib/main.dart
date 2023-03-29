import 'dart:io';

import 'package:classifier_rice/pages/neural_network_details_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:classifier_rice/models/rice.dart';
import 'package:classifier_rice/widgets/button.dart';
import 'package:classifier_rice/widgets/show_prediction.dart';

import 'classifier_rice.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeClassifierDiseaseLeaf(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeClassifierDiseaseLeaf extends StatefulWidget {
  const HomeClassifierDiseaseLeaf({super.key});

  @override
  State<HomeClassifierDiseaseLeaf> createState() =>
      _HomeClassifierDiseaseLeafState();
}

class _HomeClassifierDiseaseLeafState extends State<HomeClassifierDiseaseLeaf> {
  File? _image;
  Rice? _diseaseTomatoLeaf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detector de plagas del arroz'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Gap(12),
            setImage(),
            const Gap(12),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Button(
                  Icons.image_outlined,
                  () => loadImageAndSetPrediction(ImageSource.gallery),
                ),
                const SizedBox(height: 12),
                Button(Icons.camera_alt,
                    () => loadImageAndSetPrediction(ImageSource.camera)),
                const SizedBox(height: 12),
                Button(Icons.dehaze_rounded, () => goToDetailsModal(context)),
              ],
            ),
            const Gap(12),
            ShowPrediction(_diseaseTomatoLeaf),
          ],
        ),
      ),
    );
  }

  Future<void> loadImageAndSetPrediction(ImageSource imageSource) {
    return getImage(imageSource).then((image) {
      ClassifierRice().getPrediction(image).then((diseaseTomatoLeaf) {
        setState(() {
          _image = image;
          _diseaseTomatoLeaf = diseaseTomatoLeaf;
        });
      });
    });
  }

  Future<File> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    return File(image!.path);
  }

  Widget setImage() {
    if (_image != null) {
      return Container(
        width: 350,
        height: 550,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(_image!, fit: BoxFit.cover),
        ),
      );
    }

    return Container(
      width: 350,
      height: 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/spoon-rice.webp'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  goToDetailsModal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NeuralNetworkDetailsPage()),
    );
  }
}
