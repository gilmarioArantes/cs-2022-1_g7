
import 'package:json_annotation/json_annotation.dart';

part 'UsuarioRegister.g.dart';

@JsonSerializable()
class UsuarioRegister {
  factory UsuarioRegister.fromJson(Map<String, dynamic> json) => _$UsuarioRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioRegisterToJson(this);
  UsuarioRegister clone() => _$UsuarioRegisterFromJson(toJson());
    UsuarioRegister({
        this.id,
        this.name,
        this.email,
        this.birth,
        this.gender,
        this.phone,
        this.admin,
        this.password
    });

    String ?id;
    String ?name;
    String ?email;
    String ?password;
    String? birth;
    String ?gender;
    String ?phone;
    bool ?admin;
}
