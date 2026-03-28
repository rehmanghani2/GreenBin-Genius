// import 'dart:io';
// import 'package:image/image.dart' as img;
// import 'package:tflite_flutter/tflite_flutter.dart';

// import '../models/prediction.dart';
// import 'model_loader.dart';

// class YOLOService {
//   static Future<Prediction> detect(String imagePath) async {
//     final interpreter = ModelLoader.yoloInterpreter!;
//     final inputShape = interpreter.getInputTensor(0).shape;

//     int width = inputShape[1];
//     int height = inputShape[2];

//     final image = img.decodeImage(File(imagePath).readAsBytesSync())!;
//     final resized = img.copyResize(image, width: width, height: height);

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

//     // YOLO heads output (simplified for class + confidence)
//     var output = List.filled(84, 0.0).reshape([1, 84]);
//     interpreter.run(input, output);

//     // YOLO output first index = class, second = confidence
//     int classIndex = output[0][0].toInt();
//     double conf = output[0][1];

//     const YOLO_CLASSES = ["Cup", "Bottle", "Paper", "Plastic"];

//     return Prediction(
//       modelName: "YOLO",
//       label: YOLO_CLASSES[classIndex],
//       confidence: "${(conf * 100).toStringAsFixed(1)}%",
//       imagePath: imagePath,
//     );
//   }
// }
