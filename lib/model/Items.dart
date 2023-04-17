import 'Owner.dart';

class Items {
  Items({
    this.owner,
    this.isAccepted,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.answerId,
    this.questionId,
    this.contentLicense,
  });

  Items.fromJson(dynamic json) {
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    isAccepted = json['is_accepted'];
    score = json['score'];
    lastActivityDate = json['last_activity_date'];
    creationDate = json['creation_date'];
    answerId = json['answer_id'];
    questionId = json['question_id'];
    contentLicense = json['content_license'];
  }
  Owner? owner;
  bool? isAccepted;
  int? score;
  int? lastActivityDate;
  int? creationDate;
  int? answerId;
  int? questionId;
  String? contentLicense;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    map['is_accepted'] = isAccepted;
    map['score'] = score;
    map['last_activity_date'] = lastActivityDate;
    map['creation_date'] = creationDate;
    map['answer_id'] = answerId;
    map['question_id'] = questionId;
    map['content_license'] = contentLicense;
    return map;
  }
}
