import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:json_placeholder/application/post_detail_bloc/post_detail_bloc.dart';
import 'package:json_placeholder/domain/model/object/comment.dart';
import 'package:json_placeholder/domain/model/object/post.dart';

part 'widgets/comment_item.dart';
part 'widgets/comments_section.dart';
part 'widgets/add_comment_section.dart';

class PostDetails extends StatefulWidget {
  final Post post;

  const PostDetails({
    required this.post,
    super.key,
  });

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final PostDetailBloc _postDetailBloc = GetIt.instance.get<PostDetailBloc>();

  @override
  void initState() {
    _postDetailBloc.add(LoadComments(postId: widget.post.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.post.title),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.post.title,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.post.body,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              AddCommentSection(
                bloc: _postDetailBloc,
                postId: widget.post.id,
              ),
              const SizedBox(height: 16),
              BlocBuilder<PostDetailBloc, PostDetailState>(
                bloc: _postDetailBloc,
                builder: (context, state) {
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
