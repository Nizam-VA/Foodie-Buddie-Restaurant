import 'package:dio/dio.dart';

class Offer {
  final int offerId;
  final String offerTitle;
  final int sellerId;
  final int categoryId;
  final int offerPercentage;
  final String startDate;
  final String endDate;
  final String status;

  Offer({
    required this.offerId,
    required this.offerTitle,
    required this.sellerId,
    required this.categoryId,
    required this.offerPercentage,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      offerId: json['offerId'],
      offerTitle: json['offerTitle'],
      sellerId: json['sellerId'],
      categoryId: json['categoryId'],
      offerPercentage: json['offerPercentage'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson(Offer offer) {
    final Map<String, dynamic> data = {
      'offerId': offer.offerId,
      'offerTitle': offer.offerTitle,
      'sellerId': offer.sellerId,
      'categoryId': offer.categoryId,
      'offerPercentage': offer.offerPercentage,
      'startDate': offer.startDate,
      'endDate': offer.endDate,
      'status': offer.status,
    };

    return data;
  }
}

class OfferRequest {
  final int categoryId;
  final String offerName;
  final String status;
  final int percentage;
  final MultipartFile image;

  OfferRequest({
    required this.categoryId,
    required this.offerName,
    required this.status,
    required this.percentage,
    required this.image,
  });

  Map<String, dynamic> toJson(OfferRequest offerRequest) {
    final data = {
      'categoryId': offerRequest.categoryId,
      'image': offerRequest.image,
      'offerTitle': offerRequest.offerName,
      'offerPercentage': offerRequest.percentage,
      'status': 'ACTIVE'
    };
    return data;
  }
}
