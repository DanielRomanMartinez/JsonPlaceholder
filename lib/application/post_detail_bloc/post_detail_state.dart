part of 'post_detail_bloc.dart';

@immutable
abstract class PostDetailState extends Equatable {
  const PostDetailState();
}

class PostDetailStateInitial extends PostDetailState {
  const PostDetailStateInitial();

  @override
  List<Object> get props => [];
}

class LoadingPostDetail extends PostDetailState {
  const LoadingPostDetail();

  @override
  List<Object> get props => [];
}

class PostDetailLoaded extends PostDetailState {
  final List<Comment> comments;

  const PostDetailLoaded({
    required this.comments,
  });

  @override
  List<Object> get props => [
        comments,
      ];
}
