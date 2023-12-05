class OrderItem {
  final int quantity;
  final int salePrice;
  final int dishId;
  final int sellerId;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final int categoryId;
  final bool isVeg;
  final bool isAvailable;

  OrderItem({
    required this.quantity,
    required this.salePrice,
    required this.dishId,
    required this.sellerId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.isVeg,
    required this.isAvailable,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      quantity: json['quantity'],
      salePrice: json['salePrice'],
      dishId: json['dishId'],
      sellerId: json['sellerId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      categoryId: json['categoryId'],
      isVeg: json['isVeg'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson(OrderItem orderItem) {
    final Map<String, dynamic> data = {
      'quantity': orderItem.quantity,
      'salePrice': orderItem.salePrice,
      'dishId': orderItem.dishId,
      'sellerId': orderItem.sellerId,
      'name': orderItem.name,
      'description': orderItem.description,
      'price': orderItem.price,
      'imageUrl': orderItem.imageUrl,
      'categoryId': orderItem.categoryId,
      'isVeg': orderItem.isVeg,
      'isAvailable': orderItem.isAvailable,
    };
    return data;
  }
}
