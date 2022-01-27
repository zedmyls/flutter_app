class GoodsItemModel {
  String? category;
  int? collected;
  String? comeOutTime;
  String? coverUrl;
  int? id;
  int? price;
  int? sales;
  String? title;

  GoodsItemModel(
      {this.category, this.collected, this.comeOutTime, this.coverUrl, this.id, this.price, this.sales, this.title});

  GoodsItemModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    collected = json['collected'];
    comeOutTime = json['comeOutTime'];
    coverUrl = json['coverUrl'];
    id = json['id'];
    price = json['price'];
    sales = json['sales'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category'] = category;
    data['collected'] = collected;
    data['comeOutTime'] = comeOutTime;
    data['coverUrl'] = coverUrl;
    data['id'] = id;
    data['price'] = price;
    data['sales'] = sales;
    data['title'] = title;
    return data;
  }
}
