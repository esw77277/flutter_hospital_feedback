import 'package:json_annotation/json_annotation.dart';


part 'answers.g.dart';

@JsonSerializable()
class Answers{
  String qid;
  String answer;
  bool skipped;

  Answers({
    this.qid,
    this.answer,
    this.skipped
  });


  factory Answers.fromJson(Map<String, dynamic> json) => _$AnswersFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersToJson(this);

}