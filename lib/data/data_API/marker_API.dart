import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/add_marker_model.dart';
import 'package:rafiq/data/repositories/marker.dart';

String? token = CahchHelper.getData(key: 'token');
String? userName = CahchHelper.getData(key: 'userName');

class MarkerAPI extends MarkerRepo {
  @override
  Future<AddMarkResponseModel> addMarkRepo(
      AddMarkRequestModel addMarkRequestModel) async {
    final response = await DioHelper.postDataWithHeader(
      // {{URL}}/api/v1/users/{{user_id1}}/lists/travelMap
      url: '$URL/api/v1/users/$userName/$MARKER',
      data: addMarkRequestModel.toJson(),
      header: {'access-token': token},
    );
    return AddMarkResponseModel.fromJson(response.data);
  }
}
