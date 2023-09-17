import 'package:avocado/features/api_post/data/model/post_model.dart';
import 'package:avocado/features/api_post/domain/repository/post_repository.dart';
import 'package:avocado/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPostScreen implements UseCase<PostModel, NoParams> {
  final PostRepository repository;

  GetPostScreen({required this.repository});

  @override
  Future<Either<dynamic, PostModel>?> call(NoParams params) {
    return repository.getPostResponse();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
