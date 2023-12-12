part of 'offer_bloc.dart';

class OfferEvent {}

class GetAllOffersEvent extends OfferEvent {}

class AddOfferEvent extends OfferEvent {
  final OfferRequest offer;
  final BuildContext context;
  AddOfferEvent({required this.offer, required this.context});
}
