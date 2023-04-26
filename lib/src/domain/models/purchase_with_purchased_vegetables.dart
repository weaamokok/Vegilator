// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:vegilator/src/domain/models/purchase.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';

class PurchaseWithPurchasedVegetables extends Equatable {
  final Purchase purchase;
  final List<PurchasedVegetables> purchasedVegetables;
  const PurchaseWithPurchasedVegetables({
    required this.purchase,
    required this.purchasedVegetables,
  });

  PurchaseWithPurchasedVegetables copyWith({
    Purchase? purchase,
    List<PurchasedVegetables>? purchasedVegetables,
  }) {
    return PurchaseWithPurchasedVegetables(
      purchase: purchase ?? this.purchase,
      purchasedVegetables: purchasedVegetables ?? this.purchasedVegetables,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'purchase': purchase.toMap(),
      'purchasedVegetables': purchasedVegetables.map((x) => x.toMap()).toList(),
    };
  }

  factory PurchaseWithPurchasedVegetables.fromMap(Map<String, dynamic> map) {
    return PurchaseWithPurchasedVegetables(
      purchase: Purchase.fromMap(map['purchase'] as Map<String, dynamic>),
      purchasedVegetables: List<PurchasedVegetables>.from(
        (map['purchasedVegetables'] as List<int>).map<PurchasedVegetables>(
          (x) => PurchasedVegetables.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseWithPurchasedVegetables.fromJson(String source) =>
      PurchaseWithPurchasedVegetables.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [purchase, purchasedVegetables];
}
