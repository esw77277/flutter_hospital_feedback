import 'package:json_annotation/json_annotation.dart';

part 'questionnaire.g.dart';

@JsonSerializable()
class Questionnaire{

  String qid;
  String tid;
  String sid;
  String questionType;
  String question;
  bool required;
  bool active;
  List selectList;

  Questionnaire({
   this.qid,
   this.tid,
   this.sid,
   this.questionType,
   this.question,
   this.required,
   this.active,
   this.selectList
});

}