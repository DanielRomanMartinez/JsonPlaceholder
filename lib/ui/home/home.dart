import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:json_placeholder/application/home_bloc/home_bloc.dart';
import 'package:json_placeholder/domain/model/object/post.dart';
import 'package:json_placeholder/ui/post_details/post_details.dart';

part 'widgets/post_item.dart';

class Home extends StatelessWidget {
  final HomeBloc _homeBloc = GetIt.instance.get<HomeBloc>();

  Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc,
          builder: (context, state) {
            if (state is HomeStateInitial) {
              _homeBloc.add(const LoadHome());
            }

            if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostItem(
                      post: state.posts[index],
                      isLastPost: index == state.posts.length - 1);
                },
              );
            }

            return const Center(child: Text('Loading...'));
          },
        ),
      ),
    );
  }
}
