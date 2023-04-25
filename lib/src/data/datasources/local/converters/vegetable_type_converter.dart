import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:floor/floor.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';

class VegetableTypeConverter extends TypeConverter<Vegetable?, String> {
  @override
  Vegetable? decode(String databaseValue) {
    final List<String> result = databaseValue.split(',');
    return Vegetable(
        id: result[0] as int,
        name: result[1],
        image: result[2],
        buyingPrizePerKg: result[3] as int,
        salePrizePerKg: result[4] as int);
  }

  @override
  String encode(Vegetable? value) {
    final String result =
        '${value?.id},${value?.name},${value?.image},${value?.buyingPrizePerKg},${value?.salePrizePerKg}';
    return result;
  }
}
