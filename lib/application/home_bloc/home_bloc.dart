import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:json_placeholder/domain/model/object/post.dart';
import 'package:json_placeholder/domain/repositories/posts_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostsRepository _postsRepository;

  HomeBloc(
    this._postsRepository,
  ) : super(const HomeStateInitial()) {
    on<LoadHome>(_handleLoadHome);
  }

  Future<void> _handleLoadHome(
    LoadHome event,
    Emitter<HomeState> emit,
  ) async {
    emit(const LoadingHome());

    List<Post> posts = await _postsRepository.getPosts();

    emit(HomeLoaded(
      posts: posts,
    ));
  }
}
