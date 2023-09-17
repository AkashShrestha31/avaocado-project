import 'dart:convert';

import 'package:avocado/core/error/exceptions.dart';
import 'package:avocado/core/service/api_endpoints.dart';
import 'package:avocado/core/service/network_common.dart';
import 'package:avocado/features/api_post/data/model/post_model.dart';
import 'package:dio/dio.dart';

abstract class PostRemoteDataSource {
  Future<PostModel> getPostData();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<PostModel> getPostData() async {
    var postEndPoints = ApiEndPoints.post;
    try {
      var res = await NetworkCommon.dio.get(postEndPoints);
      List<Map<String, dynamic>> jsonList =
          List<Map<String, dynamic>>.from(res.data);
      List<Post> post = jsonList.map((json) => Post.fromJson(json)).toList();
      var response = PostModel(post: post);

      return response;
    } on DioException catch (exception) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          throw ServerException("Request timeout.");
        default:
          throw ServerException(exception.response?.data["message"]);
      }
    }
  }
}
