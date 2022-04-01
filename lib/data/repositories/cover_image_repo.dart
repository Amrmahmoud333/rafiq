import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:rafiq/data/models/delete_cover_avatar.dart';
import 'package:rafiq/data/models/set_cover_avatar_model.dart';

abstract class CoverImageRepo {
  Future<SetCoverModel> setCoverRepo({@required File? file});
  Future<SetAvatarModel> setImageRepo({@required File? file});
  Future<DeleteCoverModel> deleteCoverRepo();
  Future<DeleteAvatarModel> deleteAvatarRepo();
}
