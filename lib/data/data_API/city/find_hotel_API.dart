// ignore_for_file: file_names
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/data_API/profile/marker_API.dart';
import 'package:rafiq/data/models/city/find_hotel_model.dart';

class FindHotelAPI {
  Future<FindHotelsModel> findHotel(
      {required int roomNum,
      required int adultsNum,
      required int childrenNum,
      int childrenAges = 1,
      required String checkInDate,
      required String checkOutDate}) async {
    final response = await DioHelper.putWithHeader(
        url:
            '$URL/api/v1/cities/1392685764/hotels?room_number=$roomNum&adults_number=$adultsNum&children_number=$childrenNum&children_ages=$childrenAges&checkin_date=$checkInDate&ch/eckout_date=$checkOutDate',
        header: {'access-token': token});
    return FindHotelsModel.fromJson(response.data);
  }
}
