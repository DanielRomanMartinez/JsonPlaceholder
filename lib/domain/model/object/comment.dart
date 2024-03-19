import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int? id;
  final int postId;
  final String name;
  final String email;
  final String body;

  const Comment({
    this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'postId': postId,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  @override
  List<Object?> get props => [
    id,
    postId,
    name,
    email,
    body,
  ];
}
