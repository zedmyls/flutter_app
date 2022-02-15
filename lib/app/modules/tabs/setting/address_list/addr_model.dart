class AddrModel {
  String? name;
  String? tel;
  String? areaCode;
  bool? isDefault;
  String? addressDetail;
  String? address;
  String? userId;
  int? id;
  String? createAt;
  String? updateAt;

  AddrModel(
      {this.name,
      this.tel,
      this.areaCode,
      this.isDefault,
      this.addressDetail,
      this.address,
      this.userId,
      this.id,
      this.createAt,
      this.updateAt});

  AddrModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tel = json['tel'];
    areaCode = json['areaCode'];
    isDefault = json['isDefault'];
    addressDetail = json['addressDetail'];
    address = json['address'];
    userId = json['user_id'];
    id = json['id'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['tel'] = tel;
    data['areaCode'] = areaCode;
    data['isDefault'] = isDefault;
    data['addressDetail'] = addressDetail;
    data['address'] = address;
    data['user_id'] = userId;
    data['id'] = id;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    return data;
  }
}