import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:elahan_kscs/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/inventarisasi_model.dart';

part 'inventarisasi_event.dart';
part 'inventarisasi_state.dart';

class InventarisasiBloc extends Bloc<InventarisasiEvent, InventarisasiState> {
  InventarisasiBloc() : super(InventarisasiState(dataInventarisasi: [])) {
    on<ViewInventarisasi>(_viewInventarisasi);
  }

  FutureOr<void> _viewInventarisasi(ViewInventarisasi event, Emitter<InventarisasiState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataInventarisasi = <InventarisasiModel>[];
    print('cek data1');
    emit(
      state.copyWith(
        status: InventarisasiStateStatus.loading
      )
    );
    
    try{
      var url = Uri.parse(ApiConstant.inventarisasi);

      var request = await http.post(
        url,
        body: {
          'id_ruas' : prefs.getString('id_ruas'),
        }
      );

      var response = jsonDecode(request.body);
      for(int i=0; i<response.length; i++){
        dataInventarisasi.add(InventarisasiModel(
            idNominatif: response[i]['id_norminatif'],
            luasTanah: response[i]['luas_tanah'],
            statusSave: response[i]['status_save'],
          area: response[i]['area'],
          noPersil: response[i]['no_persil'],
          nama: response[i]['nama'],
          noKtp: response[i]['no_ktp'],
          noSiup: response[i]['no_siup'],
          alamat: response[i]['alamat'],
          provinsi: response[i]['provinsi'],
          kabupaten: response[i]['kabupaten'],
          kecamatan: response[i]['kecamatan'],
          kelurahan: response[i]['kelurahan'],
        ));
      }

      for(int i=0; i<response.length; i++) {
        print('cek dataInventarisasi ${dataInventarisasi[i].nama}');
      }
      emit(
        state.copyWith(
          status: InventarisasiStateStatus.success,
          dataInventarisasi: dataInventarisasi
        )
      );
    } catch (error) {
      state.copyWith(
        status: InventarisasiStateStatus.error,
        dataInventarisasi: dataInventarisasi
      );
    }

  }
}