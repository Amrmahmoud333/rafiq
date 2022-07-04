// ignore_for_file: file_names
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/city/find_hotel_model.dart';

class FindHotelAPI {
  Future<FindHotelsModel> findHotel(
      {required int roomNum,
      required int adultsNum,
      required int childrenNum,
      int childrenAges = 1,
      required String checkInDate,
      required String checkOutDate}) async {
    print(checkInDate);
    final response = await DioHelper.putWithHeaderAndParameters(
        url: '$URL/api/v1/cities/1356872604/hotels',
        parameters: {
          'room_number': roomNum,
          'adults_number': adultsNum,
          'children_number': childrenNum,
          'children_ages': [1, 2],
          'checkin_date': '2022-09-30',
          'checkout_date': '2022-10-02',
        });
    return FindHotelsModel.fromJson(response.data);
  }
}
