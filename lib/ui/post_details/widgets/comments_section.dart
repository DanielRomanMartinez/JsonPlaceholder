part of '../post_details.dart';

class CommentsSection extends StatelessWidget {
  final List<Comment> comments;

  const CommentsSection({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          comments.isEmpty
              ? 'No comments'
              : comments.length == 1
                  ? '1 comment'
                  : '${comments.length} comments',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        (comments.isEmpty)
            ? const SizedBox.shrink()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return CommentItem(
                      comment: comments[index],
                      isLastComment: index == comments.length - 1);
                },
              )
      ],
    );
  }
}
