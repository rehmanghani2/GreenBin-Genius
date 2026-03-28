// import 'dart:io';
// import 'package:image/image.dart' as img;
// import 'package:tflite_flutter/tflite_flutter.dart';
// import '../models/prediction.dart';
// import 'model_loader.dart';

// class CNNService {
//   static Future<Prediction> classify(String imagePath) async {
//     final interpreter = ModelLoader.cnnInterpreter!;
//     final inputShape = interpreter.getInputTensor(0).shape;
//     final outputShape = interpreter.getOutputTensor(0).shape;

//     int width = inputShape[1];
//     int height = inputShape[2];

//     // Load image
//     final image = img.decodeImage(File(imagePath).readAsBytesSync())!;
//     final resized = img.copyResize(image, width: width, height: height);

//     // Prepare input tensor
//     var input = List.generate(
//       1,
//       (_) => List.generate(
//         width,
//         (y) => List.generate(
//           height,
//           (x) => [
//             resized.getPixel(x, y).r / 255,
//             resized.getPixel(x, y).g / 255,
//             resized.getPixel(x, y).b / 255,
//           ],
//         ),
//       ),
//     );

//     // Output
//     var output = List.filled(
//       outputShape.reduce((a, b) => a * b),
//       0.0,
//     ).reshape([1, outputShape[1]]);

//     interpreter.run(input, output);

//     int maxIdx = 0;
//     double maxVal = output[0][0];

//     for (int i = 1; i < output[0].length; i++) {
//       if (output[0][i] > maxVal) {
//         maxVal = output[0][i];
//         maxIdx = i;
//       }
//     }

//     const CNN_CLASSES = ["Drink", "Food", "Cup", "Bottle"]; // example classes

//     return Prediction(
//       modelName: "CNN",
//       label: CNN_CLASSES[maxIdx],
//       confidence: "${(maxVal * 100).toStringAsFixed(1)}%",
//       imagePath: imagePath,
//     );
//   }
// }
