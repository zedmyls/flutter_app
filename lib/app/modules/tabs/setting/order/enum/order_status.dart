enum OrderStatus {
  waitingPay, // 待付款
  waitingSend, // 待发货
  waitingReceive, // 待收货
  completed, // 交易完成
  close, // 交易关闭
}

extension OrderStatusExtension on OrderStatus {
  int get status => index + 1;

  String get value {
    switch (this) {
      case OrderStatus.waitingPay:
        return '待付款';
      case OrderStatus.waitingSend:
        return '待发货';
      case OrderStatus.waitingReceive:
        return '待收货';
      case OrderStatus.completed:
        return '交易完成';
      case OrderStatus.close:
        return '交易关闭';
    }
  }
}
