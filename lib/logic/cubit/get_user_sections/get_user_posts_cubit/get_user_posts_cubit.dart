import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_user_posts_state.dart';

class GetUserPostsCubit extends Cubit<GetUserPostsState> {
  GetUserPostsCubit() : super(GetUserPostsInitial());
}
