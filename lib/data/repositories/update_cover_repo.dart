import 'package:rafiq/data/models/update_cover_model.dart';

abstract class UpdateCoverRepo {
  Future<UpdateCoverModel> updateCover();
}
