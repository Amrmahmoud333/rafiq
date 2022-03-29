import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:rafiq/data/models/set_cover_image_model.dart';

abstract class CoverImageRepo {
  Future<SetCoverModel> setCoverRepo({@required File? file});
  Future<SetAvatarModel> setImageRepo({@required File? file});

  //   Future<setCoverModel> setCoverRepo();
  // Future<setAvatarModel> setImageRepo();
}
