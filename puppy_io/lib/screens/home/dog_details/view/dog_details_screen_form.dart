import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/screens/home/dog_details/bloc/dog_details_bloc.dart';
import 'package:puppy_io/screens/home/dog_details/widgets/about_dog_card.dart';
import 'package:puppy_io/screens/home/dog_details/widgets/down_photo.dart';
import 'package:puppy_io/screens/home/dog_details/widgets/photo_gallery.dart';

class DogDetailsForm extends StatelessWidget {
  const DogDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogDetailsBloc, DogDetailsState>(
      buildWhen: (prev, current) => current is DogDetailsLoaded,
      builder: (context, state) {
        if (state is DogDetailsLoaded) {
          return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DownPhotoAppBar(dog: state.dogOffer,),
                    const SizedBox(height: 4,),
                    PhotoGallery(
                      listOfUrls: [(state).dogOffer.photoUrl, (state).dogOffer.photoUrl, (state).dogOffer.photoUrl],
                      dogName: (state).dogOffer.name,
                    ),
                    //DownPhotoAppBar(),
                  ],
                ),
              );
        } else {
          return Container();
        }
      },
    );
  }
}
