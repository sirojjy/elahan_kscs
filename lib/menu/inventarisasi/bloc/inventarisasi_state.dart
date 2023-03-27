part of 'inventarisasi_bloc.dart';

enum InventarisasiStateStatus { initial, success, error, loading }

extension InventarisasiInitial on InventarisasiStateStatus {
  bool get isInitial => this == InventarisasiStateStatus.initial;
  bool get success => this == InventarisasiStateStatus.success;
  bool get error => this == InventarisasiStateStatus.error;
  bool get loading => this == InventarisasiStateStatus.loading;
}

class InventarisasiState extends Equatable {
  final InventarisasiStateStatus status;
  final String? message;
  final List<InventarisasiModel> dataInventarisasi;
  final bool? isSuccess;

  InventarisasiState(
      {this.status = InventarisasiStateStatus.initial,
      this.message,
      required this.dataInventarisasi,
      this.isSuccess});

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    dataInventarisasi,
    isSuccess,
  ];

  InventarisasiState copyWith({
    InventarisasiStateStatus? status,
    String? message,
    List<InventarisasiModel>? dataInventarisasi,
    bool? isSuccess,
}){
    return InventarisasiState(
        dataInventarisasi: dataInventarisasi ?? this.dataInventarisasi,
        status: status ?? this.status,
        message: message ?? this.message,
        isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
