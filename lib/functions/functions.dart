import 'dart:io';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:camera_app/screens/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

createList() async {
  final dir = await getExternalStorageDirectory();
  if (dir != null) {
    var listDir = await dir.list().toList();
    for (var i = 0; i < listDir.length; i++) {
      if (listDir[i].path.endsWith('.jpg')) {
        imageNotifierList.value.add(listDir[i].path);
        imageNotifierList.notifyListeners();
      }
    }
  }
}

pickImage() async {
  final imagePick = await ImagePicker().pickImage(source: ImageSource.camera);
  if (imagePick == null) {
    return;
  } else {
    var dir = await getExternalStorageDirectory();
    File imagePath = File(imagePick.path);
    final newImage = await imagePath.copy('${dir!.path}/${DateTime.now()}.jpg');
    imageNotifierList.value.add(newImage.path);
    imageNotifierList.notifyListeners();
  }
}
