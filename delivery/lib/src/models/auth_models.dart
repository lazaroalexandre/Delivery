import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthModels {
  final String acessToken;
  AuthModels({
    required this.acessToken,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'acess_token': acessToken,
    };
  }

  factory AuthModels.fromMap(Map<String, dynamic> map) {
    return AuthModels(
      acessToken: map['acess_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModels.fromJson(String source) => AuthModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
