// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../vegetable.dart';

class VegetablesResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Vegetable> veges;
  const VegetablesResponse({
    required this.status,
    required this.totalResults,
    required this.veges,
  });

  

  factory VegetablesResponse.fromMap(Map<String, dynamic> map) {
    return VegetablesResponse(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      veges: List<Vegetable>.from((map['veges'] as List<int>).map<Vegetable>((x) => Vegetable.fromMap(x as Map<String,dynamic>),),),
    );
  }


  factory VegetablesResponse.fromJson(String source) => VegetablesResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, totalResults, veges];
}
