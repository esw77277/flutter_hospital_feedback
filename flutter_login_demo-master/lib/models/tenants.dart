import 'package:json_annotation/json_annotation.dart';
import 'address.dart';

part 'tenants.g.dart';


@JsonSerializable()
class Tenants {
  //}extends Object with _$UserSerializerMixin {
  String name;
  Address address;
  DateTime createdDate;
  DateTime updatedDate;
  String createdBy;
  String updatedBy;
  String industry;


  Tenants({
    this.name,
    this.address,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.industry
  });

  factory Tenants.fromJson(Map<String, dynamic> json) => _$TenantsFromJson(json);

  Map<String, dynamic> toJson() => _$TenantsToJson(this);
}


