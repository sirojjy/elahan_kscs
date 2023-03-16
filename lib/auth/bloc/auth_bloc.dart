import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>(_loginValidation);
  }

  FutureOr<void> _loginValidation(
      LoginEvent event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(status: AuthStateStatus.loading));

    try {
      if (event.username == '' && event.password == '') {
        emit(state.copyWith(
          status: AuthStateStatus.error,
          message: 'Username dan Password tidak boleh kosong',
        ));
      } else if (event.username == '') {
        emit(state.copyWith(
          status: AuthStateStatus.error,
          message: 'Username tidak boleh kosong',
        ));
      } else if (event.password == '') {
        emit(state.copyWith(
          status: AuthStateStatus.error,
          message: 'Password tidak boleh kosong',
        ));
      } else {
        var url = Uri.parse(ApiConstant.authentication);
        var request = await http.post(url, body: {
          'username': event.username,
          'password': event.password,
        });
        var response = jsonDecode(request.body);
        if (response['status'] == 'fail') {
          emit(state.copyWith(
            message: response['error_msg'],
            status: AuthStateStatus.error,
          ));
        } else {
          emit(state.copyWith(
            status: AuthStateStatus.success,
          ));
          print('id_ruas : ${response['id_ruas']}');
          // await prefs.setString('id_user', response['id_user']);
          await prefs.setString('id_ruas', response['id_ruas']);
          // await prefs.setString('nama_ruas', response['nama_ruas']);

          print(prefs.getString('id_ruas'));

          // print('TEST 2 : ${prefs.getString('nama')}');
        }
      }
    } catch (error) {
      emit(state.copyWith(status: AuthStateStatus.error));
    }
  }
}
