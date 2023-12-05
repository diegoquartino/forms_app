import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    
    //* Handlers
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onTransactionCountReset);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
          counter: state.counter + event.value,
          transactionCount: state.transactionCount + 1),
    );
  }

  void _onTransactionCountReset(CounterReset event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(counter: 0),
    );
  }


//* Metodos que se llamaran desde los widgets para no tener que esta haciendo
//* por ejemplo "context.read<CounterBloc>().add(CounterIncreased(value)"
//* De esta manera llamamos a un metodo con nombre y no tenemos que estar acordandonos del add() y el nombre del evento

void increaseBy([int value = 1]){
  //> Esto llama al handler "on<CounterIncreased>(_onCounterIncreased)" quien emite el nuevo estado con el cambio
  add(CounterIncreased(value));
}

void reset() {
  //> Esto llama al handler "on<CounterReset>(_onTransactionCountReset)" quien emite el nuevo estado con el cambio
  add(CounterReset());
}


}
