import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';

import '../../address_list/addr_model.dart';

class OrderModel {
  int? status;
  int? id;
  OrderDetail? orderDetail;
  AddrModel? addressId;
  String? orderNo;
  int? totalPrice;
  String? expressType;
  String? expressNo;
  String? createAt;
  String? updatedAt;

  OrderModel(
      {this.status,
      this.id,
      this.orderDetail,
      this.addressId,
      this.orderNo,
      this.totalPrice,
      this.expressType,
      this.expressNo,
      this.createAt,
      this.updatedAt});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    orderDetail = json['orderDetail'] != null ? OrderDetail?.fromJson(json['orderDetail']) : null;
    addressId = json['address_id'] != null ? AddrModel?.fromJson(json['address_id']) : null;
    orderNo = json['order_no'];
    totalPrice = json['totalPrice'];
    expressType = json['express_type'];
    expressNo = json['express_no'];
    createAt = json['create_at'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['id'] = id;
    if (orderDetail != null) {
      data['orderDetail'] = orderDetail?.toJson();
    }
    if (addressId != null) {
      data['address_id'] = addressId?.toJson();
    }
    data['order_no'] = orderNo;
    data['totalPrice'] = totalPrice;
    data['express_type'] = expressType;
    data['express_no'] = expressNo;
    data['create_at'] = createAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class OrderWithoutAddrModel {
  int? status;
  int? id;
  OrderDetail? orderDetail;
  String? orderNo;
  int? totalPrice;
  String? expressType;
  String? expressNo;
  String? createAt;
  String? updatedAt;

  OrderWithoutAddrModel(
      {this.status,
      this.id,
      this.orderDetail,
      this.orderNo,
      this.totalPrice,
      this.expressType,
      this.expressNo,
      this.createAt,
      this.updatedAt});

  OrderWithoutAddrModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    orderDetail = json['orderDetail'] != null ? OrderDetail?.fromJson(json['orderDetail']) : null;
    orderNo = json['order_no'];
    totalPrice = json['totalPrice'];
    expressType = json['express_type'];
    expressNo = json['express_no'];
    createAt = json['create_at'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['id'] = id;
    if (orderDetail != null) {
      data['orderDetail'] = orderDetail?.toJson();
    }
    data['order_no'] = orderNo;
    data['totalPrice'] = totalPrice;
    data['express_type'] = expressType;
    data['express_no'] = expressNo;
    data['create_at'] = createAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class OrderDetail {
  int? id;
  List<CartItemModel>? goodsList;

  OrderDetail({this.id, this.goodsList});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['goodsList'] != null) {
      goodsList = <CartItemModel>[];
      json['goodsList'].forEach((v) {
        goodsList?.add(CartItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (goodsList != null) {
      data['goodsList'] = goodsList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
