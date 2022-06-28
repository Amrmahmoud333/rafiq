import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'find_hotel_state.dart';

class FindHotelCubit extends Cubit<FindHotelCubitState> {
  FindHotelCubit() : super(FindHotelInitial());
}
