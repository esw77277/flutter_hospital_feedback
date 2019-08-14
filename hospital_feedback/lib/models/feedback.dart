import 'package:json_annotation/json_annotation.dart';
import 'answers.dart';

part 'feedback.g.dart';

@JsonSerializable()
class Feedback{
String consumerId;
String consumerName;
String tid;
String uid;
String sid;
String status;
DateTime date;
String summaryComments;
Answers answers;
double computedScore;

Feedback({
  this.consumerId,
  this.consumerName,
  this.tid,
  this.uid,
  this.sid,
  this.status,
  this.date,
  this.answers,
  this.summaryComments,
  this.computedScore
});
}


