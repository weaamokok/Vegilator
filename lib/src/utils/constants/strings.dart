//storage and database
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

const String usersTable = 'users_table';
const String vegetablesTable = 'vegetable';
const String purchasedVegetables = 'purchasedVegetables';
const String databaseName = 'Vegilator.db';
File file = File('images/tomato 1.png');
Uint8List by = file.readAsBytesSync();
String base64Image = base64Encode(by);
