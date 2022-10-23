import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/features/posts/presentation/widgets/body_home/menu_home/menu_home_view.dart';
import 'package:online_doctor_reservation/features/posts/presentation/widgets/body_home/notifications/notifications_view.dart';
import 'package:online_doctor_reservation/features/posts/presentation/widgets/body_home/video_share/video_share_view.dart';
import 'package:online_doctor_reservation/features/posts/presentation/widgets/head_app/header_app.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import '../widgets/body_home/posts/posts_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.singInData});
  final SingInData singInData;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[const AppBarHome()];
          },
          body: TabBarView(
            children: <Widget>[
              PostsView(),
              const VideoShareView(),
              const NotificationsView(),
              const MenuHomeView(),
            ],
          ),
        ),
      ),
    );
  }
}
