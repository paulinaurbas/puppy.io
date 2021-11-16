import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, CounterState state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(LocaleKeys.hello.tr()),
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(IncrementEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(DecrementEvent()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
