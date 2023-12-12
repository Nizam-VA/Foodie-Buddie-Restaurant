class ApiEndPoints {
  static const baseUrl = 'http://10.0.2.2:8080';
  static const addDish = '/seller/addDish';
  static const getDishesByCategory = '/seller/dishes?category=';
  static const getCategoryById = '/categories/';
  static const deleteOrUpdateDish = '/seller/dishes/';
  static const getAllOffers = '/seller/offers';
  static const addOffers = '/seller/offers/addOffer';
  static const getAllOrders = '/seller/orders';
  static const getOrderById = '/seller/orders/';
  static const dailyStatus = '/seller/sales?filter=daily';
  static const getSellerProfile = '/seller/profile';
}
