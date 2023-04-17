import 'Items.dart';

class DataModel {
  DataModel({
    this.items,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  DataModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    quotaMax = json['quota_max'];
    quotaRemaining = json['quota_remaining'];
  }
  List<Items>? items;
  bool? hasMore;
  int? quotaMax;
  int? quotaRemaining;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['has_more'] = hasMore;
    map['quota_max'] = quotaMax;
    map['quota_remaining'] = quotaRemaining;
    return map;
  }
}
