import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/models/get_profile_posts_model.dart';
import 'package:rafiq/data/repositories/profile/get_profile_sections_repo.dart';

part 'get_user_posts_state.dart';

class GetUserPostsCubit extends Cubit<GetUserPostsState> {
  GetProfileSectionsRepo getProfileSectionsRepo;
  GetUserPostsCubit({required this.getProfileSectionsRepo})
      : super(GetUserPostsInitial());

  late GetProfilePostsModel getProfilePostsModel;
  /*
  we will send in UI lastPostId 
  and the user name of the showen profile
  */
  Future<void> getPosts({String? lastPostId, String? userID}) async {
    emit(GetUserPostsLoadinngState());
    try {
      if (lastPostId == '') {
        getProfilePostsModel = await getProfileSectionsRepo.getSomeUserPost(
          lastId: lastPostId,
          url: '$URL/api/v1/users/$userID/posts?limit=1,10',
        );
      } else {
        getProfilePostsModel = await getProfileSectionsRepo.getSomeUserPost(
          lastId: lastPostId,
          url: '$URL/api/v1/users/$userID/posts/morePosts/$lastPostId',
        );
      }

      emit(GetUserPostsSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(GetUserPostsErrorState());
    }
  }

  // UI logic
  bool isMore = true;
  String label = 'See More';

  changeSeeMore() {
    isMore = !isMore;
    isMore ? label = 'See More...' : label = 'See Less...';
    emit(ChangeSeeMoreSuccessState());
  }
}
