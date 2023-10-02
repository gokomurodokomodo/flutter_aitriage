import 'package:image_picker/image_picker.dart';

class FilePickerUtil {
  FilePickerUtil._();

  static Future<XFile?> pickImage({ImageSource imageSource = ImageSource.gallery}) async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(source: imageSource);
  }
}