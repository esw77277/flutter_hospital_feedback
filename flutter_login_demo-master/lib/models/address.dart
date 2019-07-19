import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address{
  String city;
  String state;
  String country;
  String postCode;
  double longitude;
  double latitude;

  Address({
    this.city,
    this.state,
    this.country,
    this.postCode,
    this.latitude,
    this.longitude
  });


  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}