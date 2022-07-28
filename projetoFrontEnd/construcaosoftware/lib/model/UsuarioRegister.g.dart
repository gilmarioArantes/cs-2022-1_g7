// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsuarioRegister.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioRegister _$UsuarioRegisterFromJson(Map<String, dynamic> json) =>
    UsuarioRegister(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      birth: json['birth'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      admin: json['admin'] as bool?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UsuarioRegisterToJson(UsuarioRegister instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'birth': instance.birth,
      'gender': instance.gender,
      'phone': instance.phone,
      'admin': instance.admin,
    };
