import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'inventarisasi_event.dart';
part 'inventarisasi_state.dart';

class InventarisasiBloc extends Bloc<InventarisasiEvent, InventarisasiState> {
  InventarisasiBloc() : super(InventarisasiInitial()) {
    on<InventarisasiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
