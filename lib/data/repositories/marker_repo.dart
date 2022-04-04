import 'package:rafiq/data/models/add_marker_model.dart';
import 'package:rafiq/data/models/get_marker_model.dart';

abstract class MarkerRepo {
  Future<AddMarkResponseModel> addMarkRepo(
      AddMarkRequestModel addMarkRequestModel);

  Future<GetMarkerResponseModel> getMarkRepo();
}
