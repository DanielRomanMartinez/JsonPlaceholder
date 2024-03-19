import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:json_placeholder/domain/model/object/post.dart';
import 'package:json_placeholder/domain/model/value_object/response.dart';
import 'package:json_placeholder/domain/repositories/posts_repository.dart';
import 'package:json_placeholder/domain/services/http_service.dart';

@Injectable(as: PostsRepository)
class HttpPostsRepository implements PostsRepository {
  final HttpService _httpService;

  HttpPostsRepository(
    this._httpService,
  );

  @override
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];

    final Response httpResponse = await _httpService.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        'posts',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (httpResponse.statusCode == HttpStatus.ok) {
      final List postsResponse = jsonDecode(httpResponse.body);

      for (final post in postsResponse) {
        posts.add(Post.fromJson(post));
      }
    }

    return posts;
  }
}
