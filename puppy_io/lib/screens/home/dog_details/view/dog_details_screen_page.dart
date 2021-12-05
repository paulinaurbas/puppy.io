import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/screens/home/dog_details/bloc/dog_details_bloc.dart';

import 'dog_details_screen_form.dart';

class DogDetailsPage extends StatelessWidget {
  DogDetailsPage({required this.arg});

  GetIt getIt = GetIt.instance;

  DogDetailsArg arg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) {
          return getIt.get<DogDetailsBloc>()
            ..add(
              InitMainScreen(arg),
            );
        },
        child: const DogDetailsForm(),
      ),
    );
  }
}

class DogDetailsArg {
  final DogOffer dogOffer;

  DogDetailsArg(this.dogOffer);
}
