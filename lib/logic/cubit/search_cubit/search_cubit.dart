import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  String? dropDownVal;
  List<String> listVals = ['Users', 'Cities'];
  void changeVal(String newVal) {
    dropDownVal = newVal;
    emit(ChangeDropDownValState());
  }
}
