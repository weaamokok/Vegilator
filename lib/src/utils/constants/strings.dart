//storage and database
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String usersTable = 'users_table';
const String vegetablesTable = 'vegetable';
const String purchasedVegetables = 'purchasedVegetables';
const String purchaseWithPurchasedVegetables = 'purchaseWithPurchasedVegetablesTable';
const String databaseName = 'Vegilator.db';
File? defalutImage = File('images/default.png');

