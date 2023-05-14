import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentTypeModel {
  final int? id;
  final String name;
  final String acroym;
  final bool enable;
  PaymentTypeModel({
    this.id,
    required this.name,
    required this.acroym,
    required this.enable,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acroym': acroym,
      'enable': enable,
    };
  }

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      acroym: map['acroym'] as String,
      enable: map['enable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) => PaymentTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
