// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return Feedback(
      consumerId: json['consumerId'] as String,
      consumerName: json['consumerName'] as String,
      tid: json['tid'] as String,
      uid: json['uid'] as String,
      sid: json['sid'] as String,
      status: json['status'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      answers: json['answers'] == null
          ? null
          : Answers.fromJson(json['answers'] as Map<String, dynamic>),
      summaryComments: json['summaryComments'] as String,
      computedScore: (json['computedScore'] as num)?.toDouble());
}

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'consumerId': instance.consumerId,
      'consumerName': instance.consumerName,
      'tid': instance.tid,
      'uid': instance.uid,
      'sid': instance.sid,
      'status': instance.status,
      'date': instance.date?.toIso8601String(),
      'summaryComments': instance.summaryComments,
      'answers': instance.answers,
      'computedScore': instance.computedScore
    };
