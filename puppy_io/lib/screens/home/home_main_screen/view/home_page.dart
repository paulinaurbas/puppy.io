import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:puppy_io/screens/home/home_main_screen/bloc/home_screen_main_bloc.dart';

import 'home_form.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  GetIt getIt = GetIt.instance;

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) {
          return getIt.get<HomeScreenMainBloc>()
            ..add(
              InitMainScreen(),
            );
        },
        child: const HomeForm(),
      ),
    );
  }
}
