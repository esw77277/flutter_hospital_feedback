// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Services _$ServicesFromJson(Map<String, dynamic> json) {
  return Services(
      code: json['code'] as String,
      name: json['name'] as String,
      tid: json['tid'] as String);
}

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'tid': instance.tid
    };
