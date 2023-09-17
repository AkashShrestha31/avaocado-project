import 'package:avocado/core/error/failures.dart';
import 'package:avocado/features/api_post/domain/usecase/get_post_screen.dart';
import 'package:avocado/features/api_post/presentations/bloc/post_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostScreen getPostScreen;

  PostBloc({required this.getPostScreen}) : super(PostEmpty()) {
    on<GetPostData>((event, emit) async {
      try {
        emit(PostLoading());
        final failureOrData = await getPostScreen.call(NoParams());
        emit(failureOrData!.fold(
            (failure) => PostError(message: _mapFailureToMessage(failure)),
            (data) => PostLoaded(postModel: data)));
      } catch (exception) {
        emit(PostError(message: _mapFailureToMessage(ServerFailure())));
      }
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
