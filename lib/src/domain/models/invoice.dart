// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:equatable/equatable.dart';

import 'package:vegilator/src/domain/models/vegetable.dart';

class Invoice extends Equatable {
  final int? id;
  final String? serialNum;
  final String? releaseDate;
  final List<Vegetable>? veges;
  final double? sumOfVegetablePrize;
  final double? discount;
  final double? totalPrize;
  const Invoice({
    this.id,
    this.releaseDate,
    this.serialNum,
    this.veges,
    this.sumOfVegetablePrize,
    this.discount,
    this.totalPrize,
  });

  Invoice copyWith({
    int? id,
    String? releaseDate,
    List<Vegetable>? veges,
    double? sumOfVegetablePrize,
    double? discount,
    double? totalPrize,
  }) {
    return Invoice(
      id: id ?? this.id,
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
      'releaseDate': releaseDate,
      'veges': veges!.map((x) => x?.toMap()).toList(),
      'sumOfVegetablePrize': sumOfVegetablePrize,
      'discount': discount,
      'totalPrize': totalPrize,
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id'] != null ? map['id'] as int : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      veges: map['veges'] != null
          ? List<Vegetable>.from(
              (map['veges'] as List<int>).map<Vegetable?>(
                (x) => Vegetable.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      sumOfVegetablePrize: map['sumOfVegetablePrize'] != null
          ? map['sumOfVegetablePrize']
          : null,
      discount: map['discount'] != null ? map['discount'] : null,
      totalPrize: map['totalPrize'] != null ? map['totalPrize'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) =>
      Invoice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      releaseDate,
      veges,
      sumOfVegetablePrize,
      discount,
      totalPrize,
    ];
  }
}
