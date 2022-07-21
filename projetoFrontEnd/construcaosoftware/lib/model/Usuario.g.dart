// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      admin: json['admin'] as bool?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'birth': instance.birth?.toIso8601String(),
      'gender': instance.gender,
      'phone': instance.phone,
      'admin': instance.admin,
    };
