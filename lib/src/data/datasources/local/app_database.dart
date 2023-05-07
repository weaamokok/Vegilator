import 'dart:async';

import 'package:floor/floor.dart';
import 'package:vegilator/src/data/datasources/local/dao/purchase_dao.dart';
import 'package:vegilator/src/data/datasources/local/dao/purchased_vegetables.dart';
import 'package:vegilator/src/data/datasources/local/dao/vegetables_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';

import '../../../domain/models/purchase.dart';
import '../../../domain/models/purchase_with_purchased_vegetables.dart';
import 'converters/vegetable_type_converter.dart';
part 'app_database.g.dart';

@TypeConverters([VegetableTypeConverter])
@Database(version: 1, entities: [Vegetable, Purchase, PurchasedVegetables])
abstract class AppDatabase extends FloorDatabase {
  VegetableDao get vegetableDao;
  PurchaseDao get purchaseDao;
  PurchasedVegetablesDao get purchasedVegetablesDao;

  
}
