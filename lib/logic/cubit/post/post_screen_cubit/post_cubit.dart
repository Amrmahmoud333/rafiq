import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  bool isMore = true;
  String label = 'See More';

  changeSeeMore() {
    isMore = !isMore;
    isMore ? label = 'See More...' : label = 'See Less...';
    emit(ChangeSeeMoreSuccessState());
  }
}
