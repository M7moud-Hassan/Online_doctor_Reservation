import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/widgets/assestant_widgets.dart';
import 'package:online_doctor_reservation/core/widgets/snackbar_widget.dart';
import 'package:online_doctor_reservation/features/posts/presentation/widgets/body_home/posts/post_widgets.dart';

import '../../../../domain/entities/post.dart';
import '../../../cubit/posts/posts_cubit.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});
  List<Post> _posts = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is ShowMessageErrorState) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            snackBarError(context, state.message);
          });
        } else if (state is GettAllPostsState) {
          _posts = state.posts;
        }
        return ListView.separated(
          itemBuilder: (context, index) => postWidget(_posts[index].body),
          itemCount: _posts.length,
          separatorBuilder: (context, index) => separator(heigh: 20),
        );
      },
    );
  }
}
