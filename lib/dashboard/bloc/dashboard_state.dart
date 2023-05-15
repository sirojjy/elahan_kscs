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
  ///total
  final int kebBidang;
  final double kebLuas;
  final int bidangBebas;
  final double luasBebas;
  final double persenBidang;
  final double persenLuas;
  ///kategori
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

  ///jenis tanah
  final String? tanahOrangLebak;
  final String? tanahOrangSerang;
  final String? tanahOrangTangerang;
  final String? tanahPemeLebak;
  final String? tanahPemeSerang;
  final String? tanahPemeTangerang;
  final String? tanahUsahaLebak;
  final String? tanahUsahaSerang;
  final String? tanahUsahaTangerang;
  final String? tanahTkdLebak;
  final String? tanahTkdSerang;
  final String? tanahTkdTangerang;
  final String? tanahWakafLebak;
  final String? tanahWakafSerang;
  final String? tanahWakafTangerang;

  ///total jumlah bidang
  final String? inventarisasiReal;
  final String? pengumumanReal;
  final String? pengumumanBelum;
  final String? apraisalReal;
  final String? apraisalBelum;
  final String? musyawarahReal;
  final String? musyawarahBelum;
  final String? validasiReal;
  final String? validasiBelum;
  final String? sppReal;
  final String? sppBelum;
  final String? yuridisReal;
  final String? yuridisBelum;
  final String? pembayaranReal;
  final String? pembayaranBelum;
  final String? hasilReal;
  final String? hasilBelum;

  ///Total Luas Bidang
  final String? luasApraisal;
  final String? luasApraisalBelum;
  final String? luasMusyawarah;
  final String? luasMusyawarahBelum;
  final String? luasValidasi;
  final String? luasValidasiBelum;
  final String? luasSpp;
  final String? luasSppBelum;
  final String? luasYuridis;
  final String? luasYuridisBelum;
  final String? luasPembayaranSpp;
  final String? luasPembayaranSppBelum;
  final String? luasPenyerahanHasil;
  final String? luasPenyerahanHasilBelum;

  ///total nilai ganti rugi
  final String? nilaiApraisal;
  final String? nilaiMusyawarahBlm;
  final String? nilaiMusyawarahSdh;
  final String? nilaiValSdh;
  final String? nilaiValBlm;
  final String? nilaiSppSdh;
  final String? nilaiSppBlm;
  final String? nilaiYuridisSdh;
  final String? nilaiYuridisBlm;
  final String? nilaiBayarSdh;
  final String? nilaiBayarBlm;

  ///total Durasi : HARDCODE

  ///total Issue
  final String? issueLebakOpen;
  final String? issueLebakClose;
  final String? issueSerangOpen;
  final String? issueSerangClose;
  final String? issueTangeOpen;
  final String? issueTangeClose;

  ///Total Kelengkapan Dokumen
  final String? penlokLengkap;
  final String? danomLengkap;
  final String? identitasLengkap;
  final String? alasHakLengkap;
  final String? petaLengkap;
  final String? dokPendukungLengkap;

  ///total bidang belum lengkap
  final String? bidangLengkap;
  final int? bidangKurang;

  ///total kekurangan berkas
  final String? kurangPenlok;
  final String? kurangDNominatif;
  final String? kurangValidasiP2t;
  final String? kurangSpp;
  final String? kurangIdentitas;
  final String? kurangAlasHak;
  final String? kurangPeta;
  final String? kurangApraisal;
  final String? kurangPendukung;
  final String? kurangSptjp;

  const DashboardState({
    this.status = DashboardStateStatus.initial,
    this.message,
    ///total,
    this.kebBidang = 0,
    this.kebLuas = 0,
    this.bidangBebas = 0,
    this.luasBebas = 0,
    this.persenBidang = 0,
    this.persenLuas = 0,
    ///kategori
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

    ///jenis tanah
    this.tanahOrangLebak,
    this.tanahOrangSerang,
    this.tanahOrangTangerang,
    this.tanahPemeLebak,
    this.tanahPemeSerang,
    this.tanahPemeTangerang,
    this.tanahUsahaLebak,
    this.tanahUsahaSerang,
    this.tanahUsahaTangerang,
    this.tanahTkdLebak,
    this.tanahTkdSerang,
    this.tanahTkdTangerang,
    this.tanahWakafLebak,
    this.tanahWakafSerang,
    this.tanahWakafTangerang,

    ///total jumlah bidang
    this.inventarisasiReal,
    this.pengumumanReal,
    this.pengumumanBelum,
    this.apraisalReal,
    this.apraisalBelum,
    this.musyawarahReal,
    this.musyawarahBelum,
    this.validasiReal,
    this.validasiBelum,
    this.sppReal,
    this.sppBelum,
    this.yuridisReal,
    this.yuridisBelum,
    this.pembayaranReal,
    this.pembayaranBelum,
    this.hasilReal,
    this.hasilBelum,

    ///Total Luas Bidang
    this.luasApraisal,
    this.luasApraisalBelum,
    this.luasMusyawarah,
    this.luasMusyawarahBelum,
    this.luasValidasi,
    this.luasValidasiBelum,
    this.luasSpp,
    this.luasSppBelum,
    this.luasYuridis,
    this.luasYuridisBelum,
    this.luasPembayaranSpp,
    this.luasPembayaranSppBelum,
    this.luasPenyerahanHasil,
    this.luasPenyerahanHasilBelum,

    ///Total Nilai Ganti
    this.nilaiApraisal,
    this.nilaiMusyawarahBlm,
    this.nilaiMusyawarahSdh,
    this.nilaiValSdh,
    this.nilaiValBlm,
    this.nilaiSppSdh,
    this.nilaiSppBlm,
    this.nilaiYuridisSdh,
    this.nilaiYuridisBlm,
    this.nilaiBayarSdh,
    this.nilaiBayarBlm,

    ///total Issue
    this.issueLebakOpen,
    this.issueLebakClose,
    this.issueSerangOpen,
    this.issueSerangClose,
    this.issueTangeOpen,
    this.issueTangeClose,

    ///Total Kelengkapan Dokumen
    this.penlokLengkap,
    this.danomLengkap,
    this.identitasLengkap,
    this.alasHakLengkap,
    this.petaLengkap,
    this.dokPendukungLengkap,

    ///total bidang belum lengkap
    this.bidangLengkap,
    this.bidangKurang,

    ///total kekurangan berkas
    this.kurangPenlok,
    this.kurangDNominatif,
    this.kurangValidasiP2t,
    this.kurangSpp,
    this.kurangIdentitas,
    this.kurangAlasHak,
    this.kurangPeta,
    this.kurangApraisal,
    this.kurangPendukung,
    this.kurangSptjp,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    ///total,
    kebBidang,
    kebLuas,
    bidangBebas,
    luasBebas,
    persenBidang,
    persenLuas,
    ///kategori
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

    ///jenis tanah
    tanahOrangLebak,
    tanahOrangSerang,
    tanahOrangTangerang,
    tanahPemeLebak,
    tanahPemeSerang,
    tanahPemeTangerang,
    tanahUsahaLebak,
    tanahUsahaSerang,
    tanahUsahaTangerang,
    tanahTkdLebak,
    tanahTkdSerang,
    tanahTkdTangerang,
    tanahWakafLebak,
    tanahWakafSerang,
    tanahWakafTangerang,

    ///total jumlah bidang
    inventarisasiReal,
    pengumumanReal,
    pengumumanBelum,
    apraisalReal,
    apraisalBelum,
    musyawarahReal,
    musyawarahBelum,
    validasiReal,
    validasiBelum,
    sppReal,
    sppBelum,
    yuridisReal,
    yuridisBelum,
    pembayaranReal,
    pembayaranBelum,
    hasilReal,
    hasilBelum,

    ///Total Luas Bidang
    luasApraisal,
    luasApraisalBelum,
    luasMusyawarah,
    luasMusyawarahBelum,
    luasValidasi,
    luasValidasiBelum,
    luasSpp,
    luasSppBelum,
    luasYuridis,
    luasYuridisBelum,
    luasPembayaranSpp,
    luasPembayaranSppBelum,
    luasPenyerahanHasil,
    luasPenyerahanHasilBelum,

    ///Total Nilai Ganti
    nilaiApraisal,
    nilaiMusyawarahBlm,
    nilaiMusyawarahSdh,
    nilaiValSdh,
    nilaiValBlm,
    nilaiSppSdh,
    nilaiSppBlm,
    nilaiYuridisSdh,
    nilaiYuridisBlm,
    nilaiBayarSdh,
    nilaiBayarBlm,

    ///total Issue
    issueLebakOpen,
    issueLebakClose,
    issueSerangOpen,
    issueSerangClose,
    issueTangeOpen,
    issueTangeClose,

    ///Total Kelengkapan Dokumen
    penlokLengkap,
    danomLengkap,
    identitasLengkap,
    alasHakLengkap,
    petaLengkap,
    dokPendukungLengkap,

    ///total bidang belum lengkap
    bidangLengkap,
    bidangKurang,

    ///total kekurangan berkas
    kurangPenlok,
    kurangDNominatif,
    kurangValidasiP2t,
    kurangSpp,
    kurangIdentitas,
    kurangAlasHak,
    kurangPeta,
    kurangApraisal,
    kurangPendukung,
    kurangSptjp,
  ];

  DashboardState copyWith({
    DashboardStateStatus? status,
    String? message,
    ///total,
    int? kebBidang,
    double? kebLuas,
    int? bidangBebas,
    double? luasBebas,
    double? persenBidang,
    double? persenLuas,
    ///kategori
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

    ///jenis tanah
    String? tanahOrangLebak,
    String? tanahOrangSerang,
    String? tanahOrangTangerang,
    String? tanahPemeLebak,
    String? tanahPemeSerang,
    String? tanahPemeTangerang,
    String? tanahUsahaLebak,
    String? tanahUsahaSerang,
    String? tanahUsahaTangerang,
    String? tanahTkdLebak,
    String? tanahTkdSerang,
    String? tanahTkdTangerang,
    String? tanahWakafLebak,
    String? tanahWakafSerang,
    String? tanahWakafTangerang,

    ///total jumlah bidang
    String? inventarisasiReal,
    String? pengumumanReal,
    String? pengumumanBelum,
    String? apraisalReal,
    String? apraisalBelum,
    String? musyawarahReal,
    String? musyawarahBelum,
    String? validasiReal,
    String? validasiBelum,
    String? sppReal,
    String? sppBelum,
    String? yuridisReal,
    String? yuridisBelum,
    String? pembayaranReal,
    String? pembayaranBelum,
    String? hasilReal,
    String? hasilBelum,

    ///Total Luas Bidang
    String? luasApraisal,
    String? luasApraisalBelum,
    String? luasMusyawarah,
    String? luasMusyawarahBelum,
    String? luasValidasi,
    String? luasValidasiBelum,
    String? luasSpp,
    String? luasSppBelum,
    String? luasYuridis,
    String? luasYuridisBelum,
    String? luasPembayaranSpp,
    String? luasPembayaranSppBelum,
    String? luasPenyerahanHasil,
    String? luasPenyerahanHasilBelum,

    ///Total Nilai Ganti
    String? nilaiApraisal,
    String? nilaiMusyawarahBlm,
    String? nilaiMusyawarahSdh,
    String? nilaiValSdh,
    String? nilaiValBlm,
    String? nilaiSppSdh,
    String? nilaiSppBlm,
    String? nilaiYuridisSdh,
    String? nilaiYuridisBlm,
    String? nilaiBayarSdh,
    String? nilaiBayarBlm,

    ///total Issue
    String? issueLebakOpen,
    String? issueLebakClose,
    String? issueSerangOpen,
    String? issueSerangClose,
    String? issueTangeOpen,
    String? issueTangeClose,

    ///Total kelengkapan Dokumen
    String? penlokLengkap,
    String? danomLengkap,
    String? identitasLengkap,
    String? alasHakLengkap,
    String? petaLengkap,
    String? dokPendukungLengkap,

    ///total bidang belum lengkap
    String? bidangLengkap,
    int? bidangKurang,

    ///total kekurangan berkas
    String? kurangPenlok,
    String? kurangDNominatif,
    String? kurangValidasiP2t,
    String? kurangSpp,
    String? kurangIdentitas,
    String? kurangAlasHak,
    String? kurangPeta,
    String? kurangApraisal,
    String? kurangPendukung,
    String? kurangSptjp,
  }) {
    return DashboardState(
      status: status ?? this.status,
      message: message ?? this.message,
      ///total,
      kebBidang: kebBidang ?? this.kebBidang,
      kebLuas: kebLuas ?? this.kebLuas,
      bidangBebas: bidangBebas ?? this.bidangBebas,
      luasBebas: luasBebas ?? this.luasBebas,
      persenBidang: persenBidang ?? this.persenBidang,
      persenLuas: persenLuas ?? this.persenLuas,
      ///kategori
      lebak: lebak ?? this.lebak,
      serang: serang ?? this.serang,
      tangerang: tangerang ?? this.tangerang,
      totalBidang: totalBidang ?? this.totalBidang,
      luasLebak: luasLebak ?? this.luasLebak,
      luasSerang: luasSerang ?? this.luasSerang,
      luasTangerang: luasTangerang ?? this.luasTangerang,
      nilaiLebak: nilaiLebak ?? this.nilaiLebak,
      nilaiSerang: nilaiSerang ?? this.nilaiSerang,
      nilaiTangerang: nilaiTangerang ?? this.nilaiTangerang,

      ///jenis tanah
      tanahOrangLebak: tanahOrangLebak ?? this.tanahOrangLebak,
      tanahOrangSerang: tanahOrangSerang ?? this.tanahOrangSerang,
      tanahOrangTangerang: tanahOrangTangerang ?? this.tanahOrangTangerang,
      tanahPemeLebak: tanahPemeLebak ?? this.tanahPemeLebak,
      tanahPemeSerang: tanahPemeSerang ?? this.tanahPemeSerang,
      tanahPemeTangerang: tanahPemeTangerang ?? this.tanahPemeTangerang,
      tanahUsahaLebak: tanahUsahaLebak ?? this.tanahUsahaLebak,
      tanahUsahaSerang: tanahUsahaSerang ?? this.tanahUsahaSerang,
      tanahUsahaTangerang: tanahUsahaTangerang ?? this.tanahUsahaTangerang,
      tanahTkdLebak: tanahTkdLebak ?? this.tanahTkdLebak,
      tanahTkdSerang: tanahTkdSerang ?? this.tanahTkdSerang,
      tanahTkdTangerang: tanahTkdTangerang ?? this.tanahTkdTangerang,
      tanahWakafLebak: tanahWakafLebak ?? this.tanahWakafLebak,
      tanahWakafSerang: tanahWakafSerang ?? this.tanahWakafSerang,
      tanahWakafTangerang: tanahWakafTangerang ?? this.tanahWakafTangerang,

      ///total jumlah bidang
      inventarisasiReal: inventarisasiReal ?? this.inventarisasiReal,
      pengumumanReal: pengumumanReal ?? this.pengumumanReal,
      pengumumanBelum: pengumumanBelum ?? this.pengumumanBelum,
      apraisalReal: apraisalReal ?? this.apraisalReal,
      apraisalBelum: apraisalBelum ?? this.apraisalBelum,
      musyawarahReal: musyawarahReal ?? this.musyawarahReal,
      musyawarahBelum: musyawarahBelum ?? this.musyawarahBelum,
      validasiReal: validasiReal ?? this.validasiReal,
      validasiBelum: validasiBelum ?? this.validasiBelum,
      sppReal: sppReal ?? this.sppReal,
      sppBelum: sppBelum ?? this.sppBelum,
      yuridisReal: yuridisReal ?? this.yuridisReal,
      yuridisBelum: yuridisBelum ?? this.yuridisBelum,
      pembayaranReal: pembayaranReal ?? this.pembayaranReal,
      pembayaranBelum: pembayaranBelum ?? this.pembayaranBelum,
      hasilReal: hasilReal ?? this.hasilReal,
      hasilBelum: hasilBelum ?? this.hasilBelum,

      ///Total Luas Bidang
      luasApraisal: luasApraisal ?? this.luasApraisal,
      luasApraisalBelum: luasApraisalBelum ?? this.luasApraisalBelum,
      luasMusyawarah: luasMusyawarah ?? this.luasMusyawarah,
      luasMusyawarahBelum: luasMusyawarahBelum ?? this.luasMusyawarahBelum,
      luasValidasi: luasValidasi ?? this.luasValidasi,
      luasValidasiBelum: luasValidasiBelum ?? this.luasValidasiBelum,
      luasSpp: luasSpp ?? this.luasSpp,
      luasSppBelum: luasSppBelum ?? this.luasSppBelum,
      luasYuridis: luasYuridis ?? this.luasYuridis,
      luasYuridisBelum: luasYuridisBelum ?? this.luasYuridisBelum,
      luasPembayaranSpp: luasPembayaranSpp ?? this.luasPembayaranSpp,
      luasPembayaranSppBelum: luasPembayaranSppBelum ?? this.luasPembayaranSppBelum,
      luasPenyerahanHasil: luasPenyerahanHasil ?? this.luasPenyerahanHasil,
      luasPenyerahanHasilBelum: luasPenyerahanHasilBelum ?? this.luasPenyerahanHasilBelum,

      ///Total Nilai Ganti
      nilaiApraisal: nilaiApraisal ?? this.nilaiApraisal,
      nilaiMusyawarahBlm: nilaiMusyawarahBlm ?? this.nilaiMusyawarahBlm,
      nilaiMusyawarahSdh: nilaiMusyawarahSdh ?? this.nilaiMusyawarahSdh,
      nilaiValSdh: nilaiValSdh ?? this.nilaiValSdh,
      nilaiValBlm: nilaiValBlm ?? this.nilaiValBlm,
      nilaiSppSdh: nilaiSppSdh ?? this.nilaiSppSdh,
      nilaiSppBlm: nilaiSppBlm ?? this.nilaiSppBlm,
      nilaiYuridisSdh: nilaiYuridisSdh ?? this.nilaiYuridisSdh,
      nilaiYuridisBlm: nilaiYuridisBlm ?? this.nilaiYuridisBlm,
      nilaiBayarSdh: nilaiBayarSdh ?? this.nilaiBayarSdh,
      nilaiBayarBlm: nilaiBayarBlm ?? this.nilaiBayarBlm,

      ///total Issue
      issueLebakOpen: issueLebakOpen ?? this.issueLebakOpen,
      issueLebakClose: issueLebakClose ?? this.issueLebakClose,
      issueSerangOpen: issueSerangOpen ?? this.issueSerangOpen,
      issueSerangClose: issueSerangClose ?? this.issueSerangClose,
      issueTangeOpen: issueTangeOpen ?? this.issueTangeOpen,
      issueTangeClose: issueTangeClose ?? this.issueTangeClose,

      ///Total Kelengkapan dokumen
      penlokLengkap: penlokLengkap ?? this.penlokLengkap,
      danomLengkap: danomLengkap ?? this.danomLengkap,
      identitasLengkap: identitasLengkap ?? this.identitasLengkap,
      alasHakLengkap: alasHakLengkap ?? this.alasHakLengkap,
      petaLengkap: petaLengkap ?? this.petaLengkap,
      dokPendukungLengkap:
      dokPendukungLengkap ?? this.dokPendukungLengkap,

      ///total bidang belum lengkap
      bidangLengkap: bidangLengkap ?? this.bidangLengkap,
      bidangKurang: bidangKurang ?? this.bidangKurang,

      ///total kekurangan berkas
      kurangPenlok: kurangPenlok ?? this.kurangPenlok,
      kurangDNominatif: kurangDNominatif ?? this.kurangDNominatif,
      kurangValidasiP2t: kurangValidasiP2t ?? this.kurangValidasiP2t,
      kurangSpp: kurangSpp ?? this.kurangSpp,
      kurangIdentitas: kurangIdentitas ?? this.kurangIdentitas,
      kurangAlasHak: kurangAlasHak ?? this.kurangAlasHak,
      kurangPeta: kurangPeta ?? this.kurangPeta,
      kurangApraisal: kurangApraisal ?? this.kurangApraisal,
      kurangPendukung: kurangPendukung ?? this.kurangPendukung,
      kurangSptjp: kurangSptjp ?? this.kurangSptjp,
    );
  }
}