import 'package:bloc_back_button/cubit/auth_cubit.dart';
import 'package:bloc_back_button/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
    RegisterScreen({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return context.read<AuthCubit>().goBack();
      },
      child: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                           border: OutlineInputBorder()
                       ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  OutlinedButton(
                      onPressed: (){
                        context.read<AuthCubit>().register();
                      },
                      child: const Text('Register')
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
