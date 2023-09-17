import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPostData extends PostEvent {
  @override
  List<Object> get props => [];
}
