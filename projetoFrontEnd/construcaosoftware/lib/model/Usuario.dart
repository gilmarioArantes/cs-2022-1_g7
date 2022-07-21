
import 'package:json_annotation/json_annotation.dart';

part 'Usuario.g.dart';

@JsonSerializable()
class Usuario {
  factory Usuario.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
  Usuario clone() => _$UsuarioFromJson(toJson());
    Usuario({
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
    DateTime? birth;
    String ?gender;
    String ?phone;
    bool ?admin;
}
