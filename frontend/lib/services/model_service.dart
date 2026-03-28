import 'package:tflite/tflite.dart';
import '../models/prediction.dart';

class ModelService {
  static bool cnnLoaded = false;
  static bool yoloLoaded = false;

  // ------------------ CNN ------------------
  static Future<void> loadCNN() async {
    if (cnnLoaded) return;

    await Tflite.loadModel(
      model: "assets/models/cnn10c_model.tflite",
      labels: "assets/labels/cnn10c_model.txt",
    );

    cnnLoaded = true;
  }

  // ------------------ YOLO ------------------
  static Future<void> loadYOLO() async {
    if (yoloLoaded) return;

    await Tflite.loadModel(
      model: "assets/models/best_float16.tflite",
      labels: "assets/labels/best_float16.txt",
    );

    yoloLoaded = true;
  }

  // ----------- RUN CNN -------------
  static Future<Prediction?> runCNN(String path) async {
    await loadCNN();

    final output = await Tflite.runModelOnImage(
      path: path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.05,
    );

    if (output == null || output.isEmpty) return null;

    var res = output.first;

    return Prediction(
      modelName: "CNN",
      label: res["label"],
      confidence: "${(res["confidence"] * 100).toStringAsFixed(1)}%",
      imagePath: path,
    );
  }

  // ----------- RUN YOLO -------------
  static Future<Prediction?> runYOLO(String path) async {
    await loadYOLO();

    final output = await Tflite.detectObjectOnImage(
      path: path,
      threshold: 0.5,
      numResultsPerClass: 1,
    );

    if (output == null || output.isEmpty) return null;

    var res = output.first;

    return Prediction(
      modelName: "YOLO",
      label: res["detectedClass"],
      confidence: "${(res["confidenceInClass"] * 100).toStringAsFixed(1)}%",
      imagePath: path,
    );
  }
}
