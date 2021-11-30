import 'package:flutter/material.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/offer_filtering_view.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/single_dog_offer.dart';
import 'package:puppy_io/screens/home/home_main_screen/widgets/top_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  /*
  'https://images.pexels.com/photos/97082/weimaraner-puppy-dog-snout-97082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
   'https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  https://images.pexels.com/photos/7210704/pexels-photo-7210704.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TopAppBar(),
            OfferFilering(),
            SingleDogOffer(
              Dog('https://images.pexels.com/photos/7210704/pexels-photo-7210704.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  "Hasanka", 2, "Women", "Cute dog"),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleDogOffer(
              Dog('https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  "Hasanka", 2, "Women", "Cute dog"),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleDogOffer(
              Dog('https://images.pexels.com/photos/97082/weimaraner-puppy-dog-snout-97082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  "Hasanka", 2, "Women", "Cute dog"),
            ),
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
