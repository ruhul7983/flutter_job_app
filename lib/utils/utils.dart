import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file =await _imagePicker.pickImage(source: source);
  if(_file != null){
    return await _file.readAsBytes();
  }
  print("No image selected");
}


Future<Uint8List?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    allowedExtensions: ['pdf', 'png',],
    type: FileType.custom,
  );

  if (result != null) {
    String? filePath = result.files.single.path;
    if (filePath != null) {
      File file = File(filePath);
      Uint8List fileContent = await file.readAsBytes();
      return fileContent;
    }
  } else {
    print('No file selected.');
  }

  return null; // Return null if no file was selected or an error occurred.
}
