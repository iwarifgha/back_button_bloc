import 'package:bloc_back_button/cubit/auth_cubit.dart';
import 'package:bloc_back_button/cubit/auth_state_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // final key = GlobalKey<NavigatorState>();
    //Overlayment.navigationKey = key;

    return MaterialApp(
     // navigatorKey: key,
      title: 'Bloc back button',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthCubit(),
          child: const AuthStateLogic()),
    );
  }
}

