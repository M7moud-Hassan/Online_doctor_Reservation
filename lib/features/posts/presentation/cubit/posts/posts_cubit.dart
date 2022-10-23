import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/features/posts/domain/entities/post.dart';
import 'package:online_doctor_reservation/features/posts/domain/usecases/get_all_posts.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/strings/failures.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetAllPostsUsecase getAllPostsUsecase;
  PostsCubit({required this.getAllPostsUsecase}) : super(PostsInitial());
  static PostsCubit get(context) => BlocProvider.of<PostsCubit>(context);

  Future<void> getAllPosts() async {
    Either<Failure, List<Post>> result = await getAllPostsUsecase();
    result.fold((l) => emit(ShowMessageErrorState(_mapFailureToMessage(l))),
        (r) => emit(GettAllPostsState(r)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case InternetIsNotConnectingFailure:
        return CHECK_INTERNET;
      default:
        return ERROR;
    }
  }
}
