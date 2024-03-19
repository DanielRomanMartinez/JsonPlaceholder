import 'package:injectable/injectable.dart';
import 'package:json_placeholder/domain/model/object/comment.dart';
import 'package:json_placeholder/domain/repositories/comments_repository.dart';
import 'package:json_placeholder/domain/services/sqlite_service.dart';

@Injectable(as: CommentsRepository)
class SqliteCommentsRepository implements CommentsRepository {
  static String commentsTable = 'comments';

  final SqliteService _sqliteService;

  SqliteCommentsRepository(
    this._sqliteService,
  );

  @override
  Future<List<Comment>> getComments({
    required int postId,
  }) async {
    final List<Map<String, Object?>> commentsMap = await _sqliteService.get(
      commentsTable,
      where: '$postId = ?',
      whereArgs: [postId],
    );

    return [
      for (final {
            'id': id as int,
            'postId': postId as int,
            'name': name as String,
            'email': email as String,
            'body': body as String,
          } in commentsMap)
        Comment(
          id: id,
          postId: postId,
          name: name,
          email: email,
          body: body,
        ),
    ];
  }

  @override
  Future<void> saveComment({
    required Comment comment,
  }) async {
    await _sqliteService.insert(commentsTable, comment.toMap());
  }
}
