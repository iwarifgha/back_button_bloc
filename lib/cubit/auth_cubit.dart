import 'package:bloc/bloc.dart';
import 'package:bloc_back_button/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit(): super(const AuthWelcomeState(isLoading: false));

  AuthState _lastState = const AuthWelcomeState(isLoading: null);

  @override
  onChange(Change<AuthState> change){
    super.onChange(change);
    final state = change.currentState;
    if(state is AuthRegisterState) {
      _lastState = const AuthWelcomeState(isLoading: null);
    }
    if(state is AuthLoginState) {
       _lastState = const AuthRegisterState(isLoading: null);
    }
  }

  goBack(){
    emit(_lastState);
  }


  login() async {
    emit(const AuthLoginState(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(const AuthLoginState(isLoading: false));
    emit(const AuthCompleteState(isLoading: null));
    close(); //close the block here
  }


  register() async {

    //before emitting, call onChange.
    //onChange sees the current state is AuthWelcomeState, nothing happens because we are not handling any case for AuthWelcomeState inside the onChange method.
    //AuthRegisterState is emitted with isLoading == true.
    emit(const AuthRegisterState(isLoading: true));

    //wait for some seconds
    await Future.delayed(const Duration(milliseconds: 2000));


    //try to emit, but first, call onChange.
    //onChange sees the current state is AuthRegisterState, so _lastState is set to AuthWelcomeState.
    //AuthRegisterState is emitted with isLoading == false..
    //If we call goBack at this point we will arrive at the welcome screen because _lastState is set to AuthWelcomeState.
    emit(const AuthRegisterState(isLoading: false));


    //try to emit, but first, call onChange.
    //onChange sees the current state is AuthRegisterState, so _lastState is set to AuthWelcomeState.
    //AuthLoginState is emitted with isLoading == true.
    //If we call goBack at this point we will arrive at the welcome screen.This is because _lastState is still stuck at AuthRegisterState.
    //to change it we have to try to emit another state which will cause onChange to be called and then _lastState will be updated.
    emit(const AuthLoginState(isLoading: true));

    //try to emit, but first, call onChange.
    //onChange sees the current state is AuthLoginState, so _lastState is set to AuthRegisterState.
    //AuthLoginState is emitted with isLoading == false.
    //If we call goBack at this point we will arrive at the register screen.
    emit(const AuthLoginState(isLoading: false));

  }

  initialize() async {

    //before emitting, call onChange.
    //onChange sees the current state is AuthWelcomeState, nothing happens because we are not handling any case for
    //AuthWelcomeState inside the onChange method.
    // AuthWelcomeState is emitted with isLoading == true.
    emit(const AuthWelcomeState(isLoading: true));

    //wait for some seconds.
    await Future.delayed(const Duration(milliseconds: 2000));

    //before emitting, call onChange.
    //onChange sees the current state is AuthWelcomeState, nothing happens because we are not handling any case for
    //AuthWelcomeState inside the onChange method.
    // AuthWelcomeState is emitted with isLoading == false.
    emit(const AuthWelcomeState(isLoading: false));


    //before emitting, call onChange.
    //onChange sees the current state is AuthWelcomeState, nothing happens because we are not handling any case for
    //AuthWelcomeState inside the onChange method.
    //AuthRegisterState is emitted with isLoading == true.
    emit(const AuthRegisterState(isLoading: true));


    //before emitting, call onChange.
    //onChange sees the current state is AuthRegisterState, so _lastState is set to AuthWelcomeState.
    // AuthRegisterState is emitted with isLoading == false.
    emit(const AuthRegisterState(isLoading: false));

  }
}