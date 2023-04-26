import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
String converImageToString(File? imageFile){
   Uint8List U=imageFile!.readAsBytesSync();
         return base64Encode(U);
}
Future<File?> getImageFileFromAssets(String path) async {//the ultimate way to convert image to file 
  final byteData = await rootBundle.load('images/default.png');
final buffer=byteData.buffer;
  Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/default.png'; // is dump file, can be anything
    return new File(filePath).writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
}
