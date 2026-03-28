import 'dart:io';
import 'package:flutter/material.dart';
import '../../models/prediction.dart';

class ResultScreen extends StatelessWidget {
  final Prediction result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(result.modelName)),
      body: Column(
        children: [
          Image.file(File(result.imagePath), height: 250),
          Text("Label: ${result.label}", style: TextStyle(fontSize: 24)),
          Text(
            "Confidence: ${result.confidence}",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
