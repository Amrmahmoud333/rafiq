import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'newsfeed_state.dart';

class NewsfeedCubit extends Cubit<NewsfeedState> {
  NewsfeedCubit() : super(NewsfeedInitial());
}
