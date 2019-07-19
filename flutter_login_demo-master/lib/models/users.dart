import 'package:json_annotation/json_annotation.dart';


part 'users.g.dart';

@JsonSerializable()
class Users{
String name;
String email;
String tid;
Users(
{
  this.name,
  this.email,
  this.tid
});
}