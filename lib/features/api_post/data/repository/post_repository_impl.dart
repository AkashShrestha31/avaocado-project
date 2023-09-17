import 'package:avocado/core/error/exceptions.dart';
import 'package:avocado/core/network/network_info.dart';
import 'package:avocado/features/api_post/data/datasources/post_remote_datasource.dart';
import 'package:avocado/features/api_post/data/model/post_model.dart';
import 'package:avocado/features/api_post/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.postRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<dynamic, PostModel>> getPostResponse() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await postRemoteDataSource.getPostData();
        return Right(remoteData);
      } on ServerException catch (exception) {
        return left(exception.toString());
      }
    } else {
      throw ServerException();
    }
  }
}
