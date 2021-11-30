import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class Register {
  final String email;
  final String password;
  final String userName;

  Register({
    required this.userName,
    required this.email,
    required this.password,
  });

  factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
