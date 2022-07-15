import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rental_app/feature/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(Unauth()) {
    on<SignInRequest>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Auth());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(Unauth());
      }
    });

    on<SignUpRequest>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Auth());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(Unauth());
      }
    });

    on<SignOutRequest>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(Unauth());
    });
  }
}
