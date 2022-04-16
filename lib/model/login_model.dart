import 'dart:convert';

class LoginModel {
  String? token;
  int? id;
  LoginModel({
    this.token,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'id': id,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      token: map['token'] != null ? map['token'] : null,
      id: map['id']?.toInt() != null ? map['id']?.toInt() : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

      

  LoginModel copyWith({
    String? token,
    int? id,
  }) {
    return LoginModel(
      token: token ?? this.token,
      id: id ?? this.id,
    );
  }
}
