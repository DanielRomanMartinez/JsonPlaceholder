part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();

  @override
  List<Object> get props => [];
}

class LoadingHome extends HomeState {
  const LoadingHome();

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<Post> posts;

  const HomeLoaded({
    required this.posts,
  });

  @override
  List<Object> get props => [
        posts,
      ];
}
