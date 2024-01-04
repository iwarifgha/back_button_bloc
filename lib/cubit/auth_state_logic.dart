import 'package:bloc_back_button/cubit/auth_cubit.dart';
import 'package:bloc_back_button/cubit/auth_states.dart';
import 'package:bloc_back_button/screens/home.dart';
import 'package:bloc_back_button/screens/login.dart';
import 'package:bloc_back_button/screens/register.dart';
import 'package:bloc_back_button/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_back_button/util/loading_dialog.dart';

class AuthStateLogic extends StatelessWidget {
  const AuthStateLogic ({super.key});

   @override
  Widget build(BuildContext context) {
     return BlocConsumer<AuthCubit, AuthState>(
          builder: (buildContext, state){
            if(state is AuthWelcomeState){
              return const WelcomeScreen();
            }
            else if (state is AuthRegisterState){
              return RegisterScreen();
            }
            else if (state is AuthLoginState){
              return LoginScreen();
            }
            else if (state is AuthCompleteState){
              return const Home();
            }
            else{
              return const Text('No state');
            }
          },
          listener: (buildContext, state) {
            if(state.isLoading == false) Navigator.of(buildContext).pop();
            if(state.isLoading == true) showLoading(context: buildContext, text: 'Loading');
          }
      );
  }
}
