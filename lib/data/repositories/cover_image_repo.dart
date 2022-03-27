import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:rafiq/data/models/set_cover_image_model.dart';

abstract class CoverImageRepo {
  Future<setCoverModel> setCoverRepo({@required File file});
  Future<setAvatarModel> setImageRepo({@required File file});

  //   Future<setCoverModel> setCoverRepo();
  // Future<setAvatarModel> setImageRepo();
}
