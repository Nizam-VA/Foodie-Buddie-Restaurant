import 'package:image_picker/image_picker.dart';

Future<XFile> fromGallery() async {
  try {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      throw Exception('No image selected');
    }
    return image;
  } catch (e) {
    throw Exception(e);
  }
}
