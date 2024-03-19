part of '../post_details.dart';

class AddCommentSection extends StatefulWidget {
  final PostDetailBloc bloc;
  final int postId;

  const AddCommentSection({
    required this.bloc,
    required this.postId,
    super.key,
  });

  @override
  State<AddCommentSection> createState() => _AddCommentSectionState();
}

class _AddCommentSectionState extends State<AddCommentSection> {
  bool isAddCommentDisabled = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Comment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _nameController,
          onChanged: (value) => setIsAddCommentDisabled(),
          cursorColor: Colors.black,
          decoration: getTextFieldDecoration(labelText: 'Name'),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => setIsAddCommentDisabled(),
          cursorColor: Colors.black,
          decoration: getTextFieldDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _bodyController,
          minLines: 6,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          onChanged: (value) => setIsAddCommentDisabled(),
          cursorColor: Colors.black,
          decoration: getTextFieldDecoration(labelText: 'Comment'),
        ),
        const SizedBox(height: 32),
        Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: isAddCommentDisabled
                  ? Colors.grey.shade100
                  : Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                if (!isAddCommentDisabled) {
                  widget.bloc.add(SaveComment(
                    postId: widget.postId,
                    name: _nameController.value.text,
                    email: _emailController.value.text,
                    body: _bodyController.value.text,
                  ));

                  _nameController.text = '';
                  _emailController.text = '';
                  _bodyController.text = '';
                }
              },
              child: const Center(
                child: Text(
                  'Save comment',
                ),
              ),
            )),
        const SizedBox(height: 32),
      ],
    );
  }

  void setIsAddCommentDisabled() {
    setState(() {
      isAddCommentDisabled = _nameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _bodyController.text.isEmpty;
    });
  }

  InputDecoration getTextFieldDecoration({
    required String labelText,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey.shade100,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey.shade100,
          width: 2,
        ),
      ),
    );
  }
}
