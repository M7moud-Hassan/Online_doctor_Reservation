import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {required int userId,
      int? postId,
      required String title,
      required String body})
      : super(userId: userId, postId: postId, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        postId: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': postId, 'title': title, 'body': body};
  }
}
