import 'package:json_placeholder/domain/model/object/comment.dart';

abstract class CommentsRepository {
  Future<List<Comment>> getComments({
    required int postId,
  });

  Future<void> saveComment({
    required Comment comment,
  });
}
