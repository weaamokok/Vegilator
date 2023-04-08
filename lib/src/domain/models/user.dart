// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class user extends Equatable {
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? position;
  const user({
    this.name,
    this.phoneNumber,
    this.email,
    this.position,
  });

  user copyWith({
    String? name,
    String? phoneNumber,
    String? email,
    String? position,
  }) {
    return user(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'position': position,
    };
  }

  factory user.fromMap(Map<String, dynamic> map) {
    return user(
      name: map['name'] != null ? map['name'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory user.fromJson(String source) => user.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, phoneNumber, email, position];
}
