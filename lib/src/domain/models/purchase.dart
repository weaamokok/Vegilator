// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:vegilator/src/domain/models/purchasedVegetables.dart';

@Entity(tableName: 'purchases')
class Purchase extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? serialNum;
  final String? releaseDate;
  final double? sumOfVegetablePrize;
  final double? discount;
  final double? totalPrize;
  final bool? verifyed;
  @ignore
  final List<PurchasedVegetables>?
      veges; //ignoring this field to prevent floor from generating a column for it
  const Purchase(
      {this.id,
      this.serialNum,
      this.releaseDate,
      this.veges,
      this.sumOfVegetablePrize,
      this.discount,
      this.totalPrize,
      this.verifyed});

  Purchase copyWith({
    int? id,
    String? serialNum,
    String? releaseDate,
    List<PurchasedVegetables>? veges,
    double? sumOfVegetablePrize,
    double? discount,
    double? totalPrize,
  }) {
    return Purchase(
      id: id ?? this.id,
      serialNum: serialNum ?? this.serialNum,
      releaseDate: releaseDate ?? this.releaseDate,
      veges: veges ?? this.veges,
      sumOfVegetablePrize: sumOfVegetablePrize ?? this.sumOfVegetablePrize,
      discount: discount ?? this.discount,
      totalPrize: totalPrize ?? this.totalPrize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'serialNum': serialNum,
      'releaseDate': releaseDate,
      'veges': veges!.map((x) => x.toMap()).toList(),
      'sumOfVegetablePrize': sumOfVegetablePrize,
      'discount': discount,
      'totalPrize': totalPrize,
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      id: map['id'] != null ? map['id'] as int : null,
      serialNum: map['serialNum'] != null ? map['serialNum'] as String : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      veges: map['veges'] != null
          ? List<PurchasedVegetables>.from(
              (map['veges'] as List<int>).map<PurchasedVegetables?>(
                (x) => PurchasedVegetables.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      sumOfVegetablePrize: map['sumOfVegetablePrize'] != null
          ? map['sumOfVegetablePrize'] as double
          : null,
      discount: map['discount'] != null ? map['discount'] as double : null,
      totalPrize:
          map['totalPrize'] != null ? map['totalPrize'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      serialNum,
      releaseDate,
      veges,
      sumOfVegetablePrize,
      discount,
      totalPrize,
    ];
  }
}
