class UserModel {
  List<String>? addrList;
  List<String>? cartList;
  List<String>? collections;
  String? createAt;
  String? email;
  int? id;
  int? isLocked;
  String? nickname;
  int? safeLevel;
  String? updateAt;
  String? username;
  String? avatar;
  String? personalDesc;
  String? phone;

  UserModel(
      {this.addrList,
      this.cartList,
      this.collections,
      this.createAt,
      this.email,
      this.id,
      this.isLocked,
      this.nickname,
      this.safeLevel,
      this.updateAt,
      this.username,
      this.avatar,
      this.personalDesc,
      this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    addrList = json['addrList'].cast<String>();
    cartList = json['cartList'].cast<String>();
    collections = json['collections'].cast<String>();
    createAt = json['create_at'];
    email = json['email'];
    id = json['id'];
    isLocked = json['is_locked'];
    nickname = json['nickname'];
    safeLevel = json['safe_level'];
    updateAt = json['update_at'];
    username = json['username'];
    avatar = json['avatar'];
    personalDesc = json['personal_desc'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['addrList'] = addrList;
    data['cartList'] = cartList;
    data['collections'] = collections;
    data['create_at'] = createAt;
    data['email'] = email;
    data['id'] = id;
    data['is_locked'] = isLocked;
    data['nickname'] = nickname;
    data['safe_level'] = safeLevel;
    data['update_at'] = updateAt;
    data['username'] = username;
    data['avatar'] = avatar;
    data['personal_desc'] = personalDesc;
    data['phone'] = phone;
    return data;
  }
}
