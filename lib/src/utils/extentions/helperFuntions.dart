import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
String converImageToString(File imageFile){
   Uint8List U=imageFile!.readAsBytesSync();
         return base64Encode(U);
}