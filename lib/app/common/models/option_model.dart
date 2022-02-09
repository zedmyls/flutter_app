class OptionModel {
  String? key;
  String? value;

  OptionModel({this.key, this.value});

  OptionModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
