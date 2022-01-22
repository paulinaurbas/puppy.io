import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/single_dog_offer.dart';

class ListWithOffers extends StatelessWidget {
  final List<DogOffer> listWithDogsOffers;
  final bool isEditView;

  const ListWithOffers({
    Key? key,
    required this.listWithDogsOffers,
    this.isEditView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listWithDogsOffers.length,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return SingleDogOffer(
          listWithDogsOffers.elementAt(index),
          isEditView: isEditView,
        );
      },
    );
  }
}
