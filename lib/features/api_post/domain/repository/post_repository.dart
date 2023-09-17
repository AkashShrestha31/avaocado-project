import 'package:avocado/features/api_post/data/model/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<dynamic, PostModel>> getPostResponse();
}
