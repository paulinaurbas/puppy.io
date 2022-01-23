import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/screens/home/home_main_screen/bloc/home_screen_main_bloc.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/list_with_offers.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/offer_filtering_view.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/top_app_bar.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenMainBloc, HomeScreenMainState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TopAppBar(),
          OfferFiltering(),
          if (state is FilteringOfferDogsState && state.isLoading)
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          if (state is FilteringOfferDogsState)
            Expanded(
              child: ListWithOffers(
                listWithDogsOffers: state.listWithDogs,
              ),
            )
          else
            Container(),
          const SizedBox(
            height: 48,
          ),
        ],
      );
    });
  }
}
