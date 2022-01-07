import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puppy_io/data/models/dog.dart';
import 'package:puppy_io/screens/home/create_new_offer/bloc/create_new_offer_bloc.dart';

import 'create_new_offer_form.dart';

class CreateNewOfferPage extends StatelessWidget {
  CreateNewOfferPage({Key? key}) : super(key: key);

  GetIt getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return getIt.get<CreateNewOfferBloc>()
            ..add(
              InitCreateNewOfferScreen(),
            );
        },
        child: const CreateNewOfferForm(),
      ),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CreateNewOfferPage());
  }
}
