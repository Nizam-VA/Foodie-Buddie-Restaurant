part of 'offer_bloc.dart';

class OfferState {
  final List<Offer> offers;
  OfferState({required this.offers});
}

final class OfferInitial extends OfferState {
  OfferInitial() : super(offers: []);
}
