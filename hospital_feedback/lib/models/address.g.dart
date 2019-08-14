// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postCode: json['postCode'] as String,
      latitude: (json['latitude'] as num)?.toDouble(),
      longitude: (json['longitude'] as num)?.toDouble());
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postCode': instance.postCode,
      'longitude': instance.longitude,
      'latitude': instance.latitude
    };
