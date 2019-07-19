// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) {
  return Questionnaire(
      qid: json['qid'] as String,
      tid: json['tid'] as String,
      sid: json['sid'] as String,
      questionType: json['questionType'] as String,
      question: json['question'] as String,
      required: json['required'] as bool,
      active: json['active'] as bool,
      selectList: json['selectList'] as List);
}

Map<String, dynamic> _$QuestionnaireToJson(Questionnaire instance) =>
    <String, dynamic>{
      'qid': instance.qid,
      'tid': instance.tid,
      'sid': instance.sid,
      'questionType': instance.questionType,
      'question': instance.question,
      'required': instance.required,
      'active': instance.active,
      'selectList': instance.selectList
    };
