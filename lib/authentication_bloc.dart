import 'package:bloc/bloc.dart';
import 'package:healthcare_app/authentication.dart';
import 'package:healthcare_app/authentication_event.dart';
import 'package:healthcare_app/user_repository.dart';

class AuthenticationBloc
  extends Bloc<AuthenticationEvent, AuthenticationState> {
    final UserRepository userRepository;

AuthenticationBloc ({required this.userRepository})
    :assert(userRepository !=null);

 @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationState currentState,
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
  }