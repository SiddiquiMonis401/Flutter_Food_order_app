import 'package:bloc/bloc.dart';

part 'bottomnavigationcubit_state.dart';

class BottomnavigationcubitCubit extends Cubit<BottomNavigationCubitState> {
  BottomnavigationcubitCubit() : super(BottomNavigationCubitState(currentActiveTab: 0));
  
  void changeBottomNavigationTab(int activeTab) => emit(BottomNavigationCubitState(currentActiveTab: activeTab));
}
