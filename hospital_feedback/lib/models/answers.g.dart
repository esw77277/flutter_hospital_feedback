// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answers _$AnswersFromJson(Map<String, dynamic> json) {
  return Answers(
      qid: json['qid'] as String,
      answer: json['answer'] as String,
      skipped: json['skipped'] as bool);
}

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{
      'qid': instance.qid,
      'answer': instance.answer,
      'skipped': instance.skipped
    };
