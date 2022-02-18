class GoodsItemModel {
  String? category;
  int? collected;
  String? comeOutTime;
  String? coverUrl;
  int? id;
  int? price;
  int? sales;
  String? title;
  String? id_;

  GoodsItemModel({
    this.category = '',
    this.collected = -1,
    this.comeOutTime = '',
    this.coverUrl = '',
    this.id = -1,
    this.price = -1,
    this.sales = -1,
    this.title = '',
    this.id_ = '',
  });

  GoodsItemModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    collected = json['collected'];
    comeOutTime = json['comeOutTime'];
    coverUrl = json['coverUrl'];
    id = json['id'];
    price = json['price'];
    sales = json['sales'];
    title = json['title'];
    id_ = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category'] = category;
    data['collected'] = collected;
    data['comeOutTime'] = comeOutTime;
    data['coverUrl'] = coverUrl;
    data['id'] = id;
    data['_id'] = id_;
    data['price'] = price;
    data['sales'] = sales;
    data['title'] = title;
    return data;
  }
}
