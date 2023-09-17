import 'package:avocado/features/api_post/data/model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostEmpty extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final PostModel postModel;

  PostLoaded({required this.postModel});

  @override
  List<Object> get props => [postModel];
}

class PostError extends PostState {
  final String message;

  PostError({required this.message});

  @override
  List<Object> get props => [message];
}
