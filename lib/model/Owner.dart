class Owner {
  Owner({
    this.accountId,
    this.reputation,
    this.userId,
    this.userType,
    this.profileImage,
    this.displayName,
    this.link,
  });

  Owner.fromJson(dynamic json) {
    accountId = json['account_id'];
    reputation = json['reputation'];
    userId = json['user_id'];
    userType = json['user_type'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    link = json['link'];
  }
  int? accountId;
  int? reputation;
  int? userId;
  String? userType;
  String? profileImage;
  String? displayName;
  String? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_id'] = accountId;
    map['reputation'] = reputation;
    map['user_id'] = userId;
    map['user_type'] = userType;
    map['profile_image'] = profileImage;
    map['display_name'] = displayName;
    map['link'] = link;
    return map;
  }
}
