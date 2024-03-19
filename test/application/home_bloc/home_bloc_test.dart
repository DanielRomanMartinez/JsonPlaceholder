import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder/application/home_bloc/home_bloc.dart';
import 'package:json_placeholder/domain/model/object/post.dart';
import 'package:json_placeholder/domain/repositories/posts_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([
  PostsRepository,
])
void main() {
  final PostsRepository postsRepository = MockPostsRepository();

  group('Home Bloc', () {
    const Post post = Post(
      id: 1,
      userId: 1,
      title: 'Title',
      body: 'body',
    );

    final List<Post> posts = [
      post,
    ];

    when(postsRepository.getPosts()).thenAnswer(
      (_) => Future.value(posts),
    );

    blocTest(
      'Creating Bloc',
      build: () => HomeBloc(
        postsRepository,
      ),
      expect: () => [],
      verify: (_) {
        verifyNever(postsRepository.getPosts());
      },
    );

    blocTest(
      'Send Load Event',
      build: () => HomeBloc(
        postsRepository,
      )..add(const LoadHome()),
      expect: () => [
        const LoadingHome(),
        HomeLoaded(posts: posts),
      ],
      verify: (_) {
        verify(postsRepository.getPosts()).called(1);
      },
    );
  });
}
