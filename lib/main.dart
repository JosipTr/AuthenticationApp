import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/features/authentication/auth_injector.dart';
import 'package:login_app/features/authentication/presentation/bloc/auth_check_bloc/auth_check_bloc.dart';
import 'package:login_app/features/authentication/presentation/bloc/auth_check_bloc/auth_check_event.dart';
import 'package:login_app/features/authentication/presentation/pages/login_page.dart';

import 'features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initAuthDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di<AuthCheckBloc>()..add(const ApplicationStartedEvent()),
        ),
        BlocProvider(
          create: (_) => di<AuthenticationBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}
