class Prediction {
  final String modelName;
  final String label;
  final String confidence;
  final String imagePath;

  Prediction({
    required this.modelName,
    required this.label,
    required this.confidence,
    required this.imagePath,
  });
}
