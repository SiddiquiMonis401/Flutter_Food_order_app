import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_dart_state.dart';

class CounterCubitDartCubit extends Cubit<CounterCubitDartState> {
  CounterCubitDartCubit() : super(CounterCubitDartState(counterValue: 0));

  void increment() => emit(CounterCubitDartState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterCubitDartState(counterValue: state.counterValue - 1));
}
