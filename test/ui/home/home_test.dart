import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:json_placeholder/application/home_bloc/home_bloc.dart';
import 'package:json_placeholder/domain/model/object/post.dart';
import 'package:json_placeholder/ui/home/home.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_test.mocks.dart';

@GenerateMocks([
  HomeBloc,
])
void main() {
  late HomeBloc homeBloc;

  TestWidgetsFlutterBinding.ensureInitialized();

  const Post post = Post(
    id: 1,
    userId: 1,
    title: 'Title',
    body: 'Body',
  );

  setUpAll(() {
    homeBloc = MockHomeBloc();

    final getIt = GetIt.instance;
    getIt.registerSingleton<HomeBloc>(homeBloc);
  });

  group('Captured Screen Test', () {
    testWidgets('Pump and test widget - Initial', (WidgetTester tester) async {
      const HomeState homeState = HomeStateInitial();

      when(homeBloc.stream).thenAnswer((_) {
        when(homeBloc.state).thenAnswer((_) => homeState);
        return Stream.value(homeState);
      });
      when(homeBloc.state).thenAnswer((_) => homeState);

      await tester.pumpWidget(
        MaterialApp(
          home: Home(),
        ),
      );

      Finder textFinder = find.text('Loading...');
      expect(textFinder, findsOneWidget);

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('../goldens/home/home_1.png'),
      );
    });

    testWidgets('Pump and test widget - Posts Loaded', (WidgetTester tester) async {
      const HomeState homeState = HomeLoaded(
        posts: [
          post,
        ],
      );

      when(homeBloc.stream).thenAnswer((_) {
        when(homeBloc.state).thenAnswer((_) => homeState);
        return Stream.value(homeState);
      });
      when(homeBloc.state).thenAnswer((_) => homeState);

      await tester.pumpWidget(
        MaterialApp(
          home: Home(),
        ),
      );

      Finder textFinder = find.text(post.title);
      expect(textFinder, findsOneWidget);

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('../goldens/home/home_2.png'),
      );
    });
  });
}
