import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_screen_event.dart';
part 'register_screen_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, CounterState> {
  RegistrationBloc() : super(CounterState(counter: 0));

  @override
  Stream<CounterState> mapEventToState(RegistrationEvent event) async* {
    if (event is LoginEvent) {
      yield CounterState(counter: state.counter + 1);
    } else if (event is RegisterEvent) {
      yield CounterState(counter: state.counter - 1);
    }
  }
}
