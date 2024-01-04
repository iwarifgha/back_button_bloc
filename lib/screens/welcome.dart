import 'package:bloc_back_button/cubit/auth_cubit.dart';
import 'package:bloc_back_button/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('WELCOME TO THE APP'),
                  const SizedBox(height: 20,),
                  OutlinedButton(
                      onPressed: (){
                        context.read<AuthCubit>().initialize();
                      },
                      child: const Text('Continue')
                  )
                ],
              ),
            )
        );
      }
    );
  }
}