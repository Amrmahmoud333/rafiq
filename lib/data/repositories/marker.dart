import 'package:rafiq/data/models/add_marker_model.dart';

abstract class MarkerRepo {
  Future<AddMarkResponseModel> addMarkRepo(
      AddMarkRequestModel addMarkRequestModel);
}
