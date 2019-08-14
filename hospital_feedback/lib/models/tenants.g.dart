// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tenants _$TenantsFromJson(Map<String, dynamic> json) {
  return Tenants(
      name: json['name'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      createdBy: json['createdBy'] as String,
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      updatedBy: json['updatedBy'] as String,
      industry: json['industry'] as String);
}

Map<String, dynamic> _$TenantsToJson(Tenants instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'createdDate': instance.createdDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'industry': instance.industry
    };
