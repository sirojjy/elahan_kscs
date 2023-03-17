part of 'dashboard_bloc.dart';

enum DashboardStateStatus { initial, success, error, loading }

extension DashboardInitial on DashboardStateStatus {
  bool get isInitial => this == DashboardStateStatus.initial;
  bool get success => this == DashboardStateStatus.success;
  bool get error => this == DashboardStateStatus.error;
  bool get loading => this == DashboardStateStatus.loading;
}

class DashboardState extends Equatable {
  final DashboardStateStatus? status;
  final String? message;
  final String? lebak;
  final String? serang;
  final String? tangerang;
  final int? totalBidang;
  final String? luasLebak;
  final String? luasSerang;
  final String? luasTangerang;
  final String? nilaiLebak;
  final String? nilaiSerang;
  final String? nilaiTangerang;

  const DashboardState({
    this.status = DashboardStateStatus.initial,
    this.message,
    this.lebak,
    this.serang,
    this.tangerang,
    this.totalBidang,
    this.luasLebak,
    this.luasSerang,
    this.luasTangerang,
    this.nilaiLebak,
    this.nilaiSerang,
    this.nilaiTangerang,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        message,
        lebak,
        serang,
        tangerang,
        totalBidang,
        luasLebak,
        luasSerang,
        luasTangerang,
        nilaiLebak,
        nilaiSerang,
        nilaiTangerang,
      ];

  DashboardState copyWith({
    DashboardStateStatus? status,
    String? message,
    String? lebak,
    String? serang,
    String? tangerang,
    int? totalBidang,
    String? luasLebak,
    String? luasSerang,
    String? luasTangerang,
    String? nilaiLebak,
    String? nilaiSerang,
    String? nilaiTangerang,
  }) {
    return DashboardState(
        status: status ?? this.status,
        message: message ?? this.message,
        lebak: lebak ?? this.lebak,
        serang: serang ?? this.serang,
        tangerang: tangerang ?? this.tangerang,
        totalBidang: totalBidang ?? this.totalBidang,
        luasLebak: luasLebak ?? this.luasLebak,
        luasSerang: luasSerang ?? this.luasSerang,
        luasTangerang: luasTangerang ?? this.luasTangerang,
        nilaiLebak: nilaiLebak ?? this.nilaiLebak,
        nilaiSerang: nilaiSerang ?? this.nilaiSerang,
        nilaiTangerang: nilaiTangerang ?? this.nilaiTangerang
    );
  }
}

// "lebak": "278",
// "serang": "0",
// "tang": "49",
// "totalBidang": 327,
// "luas_lebak": "173988.155",
// "luas_serang": null,
// "luas_tang": "20591",
// "nilai_lebak": "12308385000",
// "nilai_serang": null,
// "nilai_tang": null,
