import 'package:bloc/bloc.dart';
import 'package:foodiebuddierestaurant/controller/api_services/offer/api_calls.dart';
import 'package:foodiebuddierestaurant/model/offer.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc() : super(OfferInitial()) {
    on<GetAllOffersEvent>((event, emit) async {
      final offers = await OfferApiServices().getAllOffers();
      emit(OfferState(offers: offers));
    });
  }
}
