import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder/domain/model/object/post.dart';
import 'package:json_placeholder/domain/model/value_object/response.dart';
import 'package:json_placeholder/domain/services/http_service.dart';
import 'package:json_placeholder/infrastructure/repositories/posts_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_repository_test.mocks.dart';

@GenerateMocks([
  HttpService,
])
void main() {
  group('Tests over Posts Repository', () {
    final HttpService httpService = MockHttpService();

    final HttpPostsRepository repository = HttpPostsRepository(
      httpService,
    );

    const String httpPostsListMockResponseOK = '''
[
{
    "userId": 1,
    "id": 1,
    "title": "title",
    "body": "body"
  }
]''';

    test('Connection OK - Pokemons OK', () async {
      when(
        httpService.get(
          Uri.https(
            'jsonplaceholder.typicode.com',
            'posts',
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      ).thenAnswer(
        (_) => Future.value(
          Response(
            body: httpPostsListMockResponseOK,
            statusCode: HttpStatus.ok,
            headers: const {'header': 'mock'},
            bodyBytes: Uint8List(1),
          ),
        ),
      );

      final result = await repository.getPosts();

      expect(result, isA<List<Post>>());
    });
  });
}
