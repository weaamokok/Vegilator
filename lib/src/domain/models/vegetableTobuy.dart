// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:retrofit/http.dart';

import 'package:vegilator/src/domain/models/vegetable.dart';

class VegetableTobuy extends Equatable {
  final Vegetable vege;
  final Double amount;
  final Double prize;
  const VegetableTobuy({
    required this.vege,
    required this.amount,
    required this.prize,
  });

  VegetableTobuy copyWith({
    Vegetable? vege,
    Double? amount,
    Double? prize,
  }) {
    return VegetableTobuy(
      vege: vege ?? this.vege,
      amount: amount ?? this.amount,
      prize: prize ?? this.prize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vege': vege.toMap(),
      'amount': amount,
      'prize': prize,
    };
  }

  factory VegetableTobuy.fromMap(Map<String, dynamic> map) {
    return VegetableTobuy(
      vege: Vegetable.fromMap(map['vege'] as Map<String, dynamic>),
      amount: map['amount'],
      prize: map['prize'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VegetableTobuy.fromJson(String source) =>
      VegetableTobuy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [vege, amount, prize];
}
