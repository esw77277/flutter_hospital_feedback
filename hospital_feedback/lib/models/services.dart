import 'package:json_annotation/json_annotation.dart';

part 'services.g.dart';

@JsonSerializable()
class Services{
String code;
String name;
String tid;

Services({
  this.code,
  this.name,
  this.tid
});

}