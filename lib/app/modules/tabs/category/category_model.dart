class CategoryModel {
  List<CategoryModel>? children;
  String? name;
  String? parent;
  String? id_;

  CategoryModel({this.children, this.name, this.parent});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['children'] != null) {
      children = <CategoryModel>[];
      json['children'].forEach((v) {
        children?.add(CategoryModel.fromJson(v));
      });
    }
    name = json['name'];
    parent = json['parent'];
    id_ = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (children != null) {
      data['children'] = children?.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['parent'] = parent;
    data['_id'] = id_;
    return data;
  }
}
