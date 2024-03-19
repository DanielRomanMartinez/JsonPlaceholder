import 'package:json_placeholder/domain/model/object/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();
}
