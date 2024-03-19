part of '../post_details.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final bool isLastComment;

  const CommentItem({
    super.key,
    required this.comment,
    required this.isLastComment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(comment.name),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text('Email: ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(comment.email),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Comment: ',
            style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
            color: Colors.grey.shade100,
          ),
          child: Text(comment.body),
        ),
        isLastComment ? const SizedBox.shrink() : const SizedBox(height: 16),
        isLastComment ? const SizedBox.shrink() : const Divider(),
        isLastComment ? const SizedBox.shrink() : const SizedBox(height: 16),
      ],
    );
  }
}
