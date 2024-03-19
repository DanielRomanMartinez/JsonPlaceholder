part of 'post_detail_bloc.dart';

abstract class PostDetailEvent extends Equatable {
  const PostDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadComments extends PostDetailEvent {
  final int postId;

  const LoadComments({
    required this.postId,
  });

  @override
  List<Object?> get props => [
    postId,
      ];
}

class SaveComment extends PostDetailEvent {
  final int postId;
  final String name;
  final String email;
  final String body;

  const SaveComment({
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  List<Object?> get props => [
    postId,
    email,
    email,
    body,
  ];
}
