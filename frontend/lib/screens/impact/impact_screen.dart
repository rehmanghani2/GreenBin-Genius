import 'package:flutter/material.dart';
import '../../services/camera_service.dart';
import '../preview/preview_screen.dart';

class ImpactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Impact Screen")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          final path = await CameraService.takePhoto();
          if (path != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PreviewScreen(imagePath: path)),
            );
          }
        },
      ),
    );
  }
}
