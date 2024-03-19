import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:json_placeholder/application/post_detail_bloc/post_detail_bloc.dart';
import 'package:json_placeholder/domain/model/object/comment.dart';
import 'package:json_placeholder/domain/model/object/post.dart';

part 'widgets/comment_item.dart';
part 'widgets/comments_section.dart';
part 'widgets/add_comment_section.dart';

class PostDetails extends StatelessWidget {
  final Post post;

  final PostDetailBloc _postDetailBloc = GetIt.instance.get<PostDetailBloc>();

  PostDetails({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                post.body,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              AddCommentSection(
                bloc: _postDetailBloc,
                postId: post.id,
              ),
              const SizedBox(height: 16),
              BlocBuilder<PostDetailBloc, PostDetailState>(
                bloc: _postDetailBloc,
                builder: (context, state) {
                  if (state is PostDetailStateInitial) {
                    _postDetailBloc.add(LoadComments(postId: post.id));
                  }
        
                  if (state is PostDetailLoaded) {
                    return CommentsSection(comments: state.comments);
                  }

                  return const Center(child: Text('Loading...'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
