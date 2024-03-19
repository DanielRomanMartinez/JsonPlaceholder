import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:json_placeholder/domain/model/object/comment.dart';
import 'package:json_placeholder/domain/repositories/comments_repository.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

@lazySingleton
class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final CommentsRepository _commentsRepository;

  PostDetailBloc(
    this._commentsRepository,
  ) : super(const PostDetailStateInitial()) {
    on<LoadComments>(_handleLoadComments);
    on<SaveComment>(_handleSaveComment);
  }

  Future<void> _handleLoadComments(
    LoadComments event,
    Emitter<PostDetailState> emit,
  ) async {
    emit(const LoadingPostDetail());

    List<Comment> comments =
        await _commentsRepository.getComments(postId: event.postId);

    emit(PostDetailLoaded(
      comments: comments,
    ));
  }

  Future<void> _handleSaveComment(
    SaveComment event,
    Emitter<PostDetailState> emit,
  ) async {

    await _commentsRepository.saveComment(
      comment: Comment(
        postId: event.postId,
        name: event.name,
        email: event.email,
        body: event.body,
      ),
    );

    add(LoadComments(postId: event.postId));
  }
}
