import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/offer/offer_bloc.dart';
import 'package:foodiebuddierestaurant/utils/text_styles.dart';
import 'package:foodiebuddierestaurant/view/screen/add_offer/screen_add_offer.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/section_header.dart';

class ScreenOffers extends StatelessWidget {
  const ScreenOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<OfferBloc>().add(GetAllOffersEvent());
    context.read<CategoryBloc>().add(CategoryEvent());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Offers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<OfferBloc, OfferState>(
          builder: (context, state) {
            return state.offers.isEmpty
                ? Center(child: Image.asset('assets/images/icons/empty.gif'))
                : ListView.builder(
                    itemCount: state.offers.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            width: width,
                            height: height * .25,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/icons/gift-box.png',
                                  height: height * .1,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SectionHead(
                                        heading:
                                            state.offers[index].offerTitle),
                                    BlocBuilder<CategoryBloc, CategoryState>(
                                      builder: (context, state) {
                                        return Text(
                                            'for ${state.categories[index].name}');
                                      },
                                    ),
                                    Text(
                                        'Starts ${state.offers[index].startDate.substring(0, 10)}'),
                                    Text(
                                        'End with ${state.offers[index].endDate.substring(0, 10)}'),
                                    Text(state.offers[index].status),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.green[700],
                                  child: Text(
                                      '${state.offers[index].offerPercentage}%',
                                      style: boldWhite),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScreenAddOffer(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
