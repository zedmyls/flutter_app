class UserUpdateRequestModel {
  late String nickname;
  late String avatar;
  late String personalDesc;

  UserUpdateRequestModel({
    this.nickname = '',
    this.avatar = '',
    this.personalDesc = '',
  });

  UserUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    avatar = json['avatar'];
    personalDesc = json['personal_desc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['avatar'] = avatar;
    data['personal_desc'] = personalDesc;
    return data;
  }
}
