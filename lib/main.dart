import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/themes/theme_app.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/bloc/sing_in/sing_in_bloc.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/pages/sing_in_page.dart';
import 'features/posts/presentation/cubit/posts/posts_cubit.dart';
import 'features/sing_in_up/presentation/bloc/sing_up/sing_up_bloc.dart';
import 'injections/injection_sing_in.dart' as di;
import 'injections/injection_posts.dart' as di2;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  await di2.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<SingInBloc>()..add(CheckNetwortEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<SingUpBloc>()..add(SignUpAsPersonEvent()),
        ),
        BlocProvider(create: (context) => di.sl<PostsCubit>()..getAllPosts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SingInPage(),
      ),
    );
  }
}
