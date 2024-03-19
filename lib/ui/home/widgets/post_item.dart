part of '../home.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final bool isLastPost;

  const PostItem({
    required this.post,
    required this.isLastPost,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PostDetails(
          post: post,
        ),
      )),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
            isLastPost ? const SizedBox.shrink() : const SizedBox(height: 16),
            isLastPost ? const SizedBox.shrink() : const Divider(),
          ],
        ),
      ),
    );
  }
}
