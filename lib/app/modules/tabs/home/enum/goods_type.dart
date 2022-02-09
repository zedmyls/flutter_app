enum GoodsType {
  sale,
  recommend,
  newGoods,
}

extension GoodsTypeExtension on GoodsType {
  String get value {
    switch (this) {
      case GoodsType.newGoods:
        return 'new';
      case GoodsType.recommend:
        return 'recommend';
      case GoodsType.sale:
        return 'sale';
    }
  }
}
