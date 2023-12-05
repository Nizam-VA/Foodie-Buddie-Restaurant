class Order {
  final int orderId;
  final int userId;
  final int addressId;
  final int sellerId;
  final String couponCode;
  final String orderDate;
  final String deliveryDate;
  final String paymentMethod;
  final String transactionId;
  final int itemCount;
  final int discount;
  final int deliveryCharge;
  final int totalPrice;
  final String orderStatus;
  final String paymentStatus;

  Order({
    required this.orderId,
    required this.userId,
    required this.addressId,
    required this.sellerId,
    required this.couponCode,
    required this.orderDate,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.transactionId,
    required this.itemCount,
    required this.discount,
    required this.deliveryCharge,
    required this.totalPrice,
    required this.orderStatus,
    required this.paymentStatus,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      userId: json['userId'],
      addressId: json['addressId'],
      sellerId: json['sellerId'],
      couponCode: json['couponCode'],
      orderDate: json['orderDate'],
      deliveryDate: json['deliveryDate'],
      paymentMethod: json['paymentMethod'],
      transactionId: json['transactionId'],
      itemCount: json['itemCount'],
      discount: json['discount'],
      deliveryCharge: json['deliveryCharge'],
      totalPrice: json['totalPrice'],
      orderStatus: json['orderStatus'],
      paymentStatus: json['paymentStatus'],
    );
  }

  Map<String, dynamic> toJson(Order order) {
    final Map<String, dynamic> data = {
      'orderId': order.orderId,
      'userId': order.userId,
      'addressId': order.addressId,
      'sellerId': order.sellerId,
      'couponCode': order.couponCode,
      'orderDate': order.orderDate,
      'deliveryDate': order.deliveryDate,
      'paymentMethod': order.paymentMethod,
      'transactionId': order.transactionId,
      'itemCount': order.itemCount,
      'discount': order.discount,
      'deliveryCharge': order.deliveryCharge,
      'totalPrice': order.totalPrice,
      'orderStatus': order.orderStatus,
      'paymentStatus': order.paymentStatus,
    };
    return data;
  }
}
