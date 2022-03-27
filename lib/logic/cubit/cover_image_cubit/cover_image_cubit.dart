import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cover_image_state.dart';

class CoverImageCubit extends Cubit<CoverImageState> {
  CoverImageCubit() : super(CoverImageInitial());
}
