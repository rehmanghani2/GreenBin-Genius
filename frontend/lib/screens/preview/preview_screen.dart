import 'dart:io';
import 'package:flutter/material.dart';
import '../../services/model_service.dart';
import '../result/result_screen.dart';

class PreviewScreen extends StatelessWidget {
  final String imagePath;
  const PreviewScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Start with a Photo")),
      body: Column(
        children: [
          Expanded(child: Image.file(File(imagePath))),

          ElevatedButton(
            onPressed: () async {
              final r = await ModelService.runCNN(imagePath);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ResultScreen(result: r!)),
              );
            },
            child: const Text("Scan with CNN"),
          ),

          ElevatedButton(
            onPressed: () async {
              final r = await ModelService.runYOLO(imagePath);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ResultScreen(result: r!)),
              );
            },
            child: const Text("Detect with YOLO"),
          ),
        ],
      ),
    );
  }
}
