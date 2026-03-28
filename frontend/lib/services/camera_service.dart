import 'package:image_picker/image_picker.dart';

class CameraService {
  static final picker = ImagePicker();

  static Future<String?> takePhoto() async {
    final XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );

    return photo?.path;
  }
}
