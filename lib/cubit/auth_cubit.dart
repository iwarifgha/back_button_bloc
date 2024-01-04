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
    else if(state is AuthLoginState) {
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
    close();
  }


  register() async {
    emit(const AuthRegisterState(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 2000));
    emit(const AuthRegisterState(isLoading: false));
    emit(const AuthLoginState(isLoading: null));
  }

  initialize() async {
    emit(const AuthWelcomeState(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 2000));
    emit(const AuthWelcomeState(isLoading: false));
    emit(const AuthRegisterState(isLoading: null));
  }
}