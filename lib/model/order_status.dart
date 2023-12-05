class OrderStatus {
  final String orderStatus;

  OrderStatus({required this.orderStatus});

  // OrderStatus.fromJson(Map<String, dynamic> json) {
  //   orderStatus = json['orderStatus'];
  // }

  Map<String, dynamic> toJson(OrderStatus status) {
    final Map<String, dynamic> data = {
      'orderStatus': status.orderStatus,
    };
    return data;
  }
}
