import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int userId;
  final int postId;
  final String title;
  final String body;

  const Post(
      {required this.userId,
      required this.postId,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [userId, postId, title, body];
}
