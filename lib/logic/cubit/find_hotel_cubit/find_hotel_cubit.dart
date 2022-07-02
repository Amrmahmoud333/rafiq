import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/city/find_hotel_API.dart';
import 'package:rafiq/data/models/city/find_hotel_model.dart';

part 'find_hotel_state.dart';

class FindHotelCubit extends Cubit<FindHotelState> {
  FindHotelAPI findHotelAPI;
  FindHotelCubit({required this.findHotelAPI}) : super(FindHotelInitial());

  late FindHotelsModel findHotelsModel;

  Future<void> findHotel(
      {required int roomNum,
      required int adultsNum,
      required int childrenNum,
      required String checkInDate,
      required String checkOutDate}) async {
    emit(FindHotelLoading());
    try {
      findHotelsModel = await findHotelAPI.findHotel(
          roomNum: roomNum,
          adultsNum: adultsNum,
          childrenNum: childrenNum,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate);
      emit(FindHotelSuccess());
    } on DioError catch (error) {
      print(error.response);
      emit(FindHotelError());
    }
  }

  // UI logic
  int room = 0, adults = 0, child = 0;
  addRoom() {
    room++;
    emit(AddRoomState());
  }

  minusRoom() {
    if (room != 0) room--;
    emit(MinusRoomState());
  }

  addAdults() {
    adults++;
    emit(AddAdultsState());
  }

  minusAdults() {
    if (adults != 0) adults--;
    emit(MinusAdultsState());
  }

  addChild() {
    child++;
    emit(AddChildState());
  }

  minusChild() {
    if (child != 0) child--;
    emit(MinusChildState());
  }
}