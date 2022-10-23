part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class GettAllPostsState extends PostsState {
  final List<Post> posts;
  const GettAllPostsState(this.posts);
  @override
  List<Object> get props => [posts];
}

class ShowMessageErrorState extends PostsState {
  final String message;

  const ShowMessageErrorState(this.message);
  @override
  List<Object> get props => [message];
}
