import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/controller/api_services/offer/api_calls.dart';
import 'package:foodiebuddierestaurant/model/offer.dart';
import 'package:foodiebuddierestaurant/view/widgets/functions/snack_bar.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc() : super(OfferInitial()) {
    on<GetAllOffersEvent>((event, emit) async {
      final offers = await OfferApiServices().getAllOffers();
      emit(OfferState(offers: offers));
    });
    on<AddOfferEvent>((event, emit) async {
      final value = await OfferApiServices().addOffer(event.offer);
      if (value) {
        final offers = await OfferApiServices().getAllOffers();
        emit(OfferState(offers: offers));
        Navigator.of(event.context).pop();
        showSnack(event.context, Colors.green, 'Offer added successfully');
      } else {
        showSnack(event.context, Colors.red, 'Offer cant add');
      }
    });
  }
}
