import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:elahan_kscs/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<DashboardEvent>((event, emit) {
      on<OnDashboardEvent>(_DashboardEvent);
    });
  }

  FutureOr<void> _DashboardEvent(OnDashboardEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    
    emit(
      state.copyWith(
        status: DashboardStateStatus.loading
      )
    );
    print('id_ruas ${prefs.getString('id_ruas')}');
    try{
      var url = Uri.parse(ApiConstant.dashboard);
      var request = await http.post(
        url,
        body: {
          'id_ruas' : prefs.getString('id_ruas'),
        }
      );
      var response = jsonDecode(request.body);

      print('respon');
      if(response == null) {
        emit(
          state.copyWith(
            message: response['error_msg'],
            status:  DashboardStateStatus.error,
          )
        );
      } else {
        emit(
          state.copyWith(
            status: DashboardStateStatus.success,
            lebak: response['lebak'],
            serang: response['serang'],
            tangerang: response['tang'],
            totalBidang: response['totalBidang'],
            luasLebak: response['luas_lebak'],
            luasSerang: response['luas_serang'],
            luasTangerang: response['luas_tang'],
            nilaiLebak: response['nilai_lebak'],
            nilaiSerang: response['nilai_serang'],
            nilaiTangerang: response['nilai_tang'],
          )
        );
        print('sukses nih');
        // print('DATA ${response['0']['lebak']}');
        // print('DATA ${response['serang']}');
      }
    } catch(error) {
      print('error nih');
      print(error);
      emit(
        state.copyWith(
          status: DashboardStateStatus.error
        )
      );
    }
  }
}
