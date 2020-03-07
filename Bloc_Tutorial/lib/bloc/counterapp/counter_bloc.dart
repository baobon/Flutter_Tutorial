import 'package:bloc/bloc.dart';
import 'counter_event.dart';

/* Xu li du lieu */

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.up:
        yield state + 1;
        break;
      case CounterEvent.down:
        yield state - 1;
        break;
    }
  }
}