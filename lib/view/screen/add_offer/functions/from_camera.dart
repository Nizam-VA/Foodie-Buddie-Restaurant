import 'package:image_picker/image_picker.dart';

Future<XFile> fromCamera() async {
  try {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      throw Exception('No image selected');
    }
    return image;
  } catch (e) {
    throw Exception(e);
  }
}
