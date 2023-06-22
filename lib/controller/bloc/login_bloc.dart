import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      if (event.password == null ||
          event.userid == null ||
          event.password == "" ||
          event.userid == "") {
        emit(LoginError("userid atau password kosong"));
      } else {
        emit(LoginLoading());
        await Future.delayed(const Duration(seconds: 3))
            .then((_) => emit(LoginSuccess()));
      }
    });
  }
}
