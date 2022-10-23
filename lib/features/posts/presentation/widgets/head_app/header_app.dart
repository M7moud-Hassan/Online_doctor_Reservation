import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/features/posts/presentation/widgets/head_app/head_widgets.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SliverAppBar(
        automaticallyImplyLeading: false,
        title: titleHome,
        floating: true,
        pinned: true,
        snap: true,
        actions: [
          btnAppBar(() {}, Icons.add),
          btnAppBar(() {}, Icons.search),
          btnAppBar(() {}, Icons.message)
        ],
        bottom: TabBar(
          tabs: <Tab>[
            tabWidget(Icons.home),
            tabWidget(Icons.video_call),
            tabWidget(Icons.note),
            tabWidget(Icons.menu)
          ],
        ),
      ),
    );
  }
}
