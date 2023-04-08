// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Vegetable extends Equatable {
  final int id;
  final String name;
  final ImageProvider image;
  final int buyingPrizePerKg;
  final int salePrizePerKg;
  const Vegetable({
    required this.id,
    required this.name,
    required this.image,
    required this.buyingPrizePerKg,
    required this.salePrizePerKg,
  });

  Vegetable copyWith({
    int? id,
    String? name,
    ImageProvider? image,
    int? buyingPrizePerKg,
    int? salePrizePerKg,
  }) {
    return Vegetable(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      buyingPrizePerKg: buyingPrizePerKg ?? this.buyingPrizePerKg,
      salePrizePerKg: salePrizePerKg ?? this.salePrizePerKg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'buyingPrizePerKg': buyingPrizePerKg,
      'salePrizePerKg': salePrizePerKg,
    };
  }

  factory Vegetable.fromMap(Map<String, dynamic> map) {
    return Vegetable(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as ImageProvider,
      buyingPrizePerKg: map['buyingPrizePerKg'] as int,
      salePrizePerKg: map['salePrizePerKg'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vegetable.fromJson(String source) =>
      Vegetable.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      buyingPrizePerKg,
      salePrizePerKg,
    ];
  }
}
