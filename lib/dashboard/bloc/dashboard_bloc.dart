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
    on<ViewDashboardEvent>(_DashboardEvent);
  }

  FutureOr<void> _DashboardEvent(ViewDashboardEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;

    emit(
        state.copyWith(
            status: DashboardStateStatus.loading
        )
    );
    // print('id_ruas ${prefs.getString('id_ruas')}');
    try{
      var url = Uri.parse(ApiConstant.dashboard);
      var request = await http.post(
          url,
          body: {
            'id_ruas' : prefs.getString('id_ruas'),
          }
      );
      var response = jsonDecode(request.body);

      // print('respon');
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
              ///total,
              kebBidang: response['keb_bidang'],
              kebLuas: response['keb_luas'],
              bidangBebas: response['bidang_bebas'],
              luasBebas: response['luas_bebas'],
              persenBidang: response['persen_bidang'] ?? 0,
              persenLuas: response['persen_luas'] ?? 0,
              ///kategori
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
              ///jenis tanah
              tanahOrangLebak: response['tanah_org_lbk'],
              tanahOrangSerang: response['tanah_org_srg'],
              tanahOrangTangerang: response['tanah_org_tgr'],
              tanahPemeLebak: response['tanah_pem_lbk'],
              tanahPemeSerang: response['tanah_pem_srg'],
              tanahPemeTangerang: response['tanah_pem_tgr'],
              tanahUsahaLebak: response['tanah_per_lbk'],
              tanahUsahaSerang: response['tanah_per_srg'],
              tanahUsahaTangerang: response['tanah_per_tgr'],
              tanahTkdLebak: response['tanah_tkd_lbk'],
              tanahTkdSerang: response['tanah_tkd_srg'],
              tanahTkdTangerang: response['tanah_tkd_tgr'],
              tanahWakafLebak: response['tanah_wkf_lbk'],
              tanahWakafSerang: response['tanah_wkf_srg'],
              tanahWakafTangerang: response['tanah_wkf_tgr'],
              ///total jumlah bidang
              inventarisasiReal: response['inventarisasi_r'],
              pengumumanReal: response['pengumuman_r'],
              pengumumanBelum: response['pengumuman_r_blm'],
              apraisalReal: response['pengumuman_r'],
              apraisalBelum: response['pengumuman_r_blm'],
              musyawarahReal: response['musyawarah_r'],
              musyawarahBelum: response['musyawarah_r_blm'],
              validasiReal: response['validasi_r'],
              validasiBelum: response['validasi_r_blm'],
              sppReal: response['spp_r_oke'],
              sppBelum: response['spp_r_blm'],
              yuridisReal: response['yuridis2_sudah'],
              yuridisBelum: response['yuridis2_belum'],
              pembayaranReal: response['bayar_sudah'],
              pembayaranBelum: response['bayar_belum'],
              hasilReal: response['bayar_sudah'],
              hasilBelum: response['bayar_belum'],
              ///Total Luas Bidang
              luasApraisal: response['luas_apraisalSdh'],
              luasApraisalBelum: response['luas_apraisalBlm'],
              luasMusyawarah: response['luas_musyawarahSdh'],
              luasMusyawarahBelum: response['luas_musyawarahBlm'],
              luasValidasi: response['luas_validasiSdh'],
              luasValidasiBelum: response['luas_validasiBlm'],
              luasSpp: response['luas_sppSdh'],
              luasSppBelum: response['luas_sppBlm'],
              luasYuridis: response['luas_yuridisSdh'],
              luasYuridisBelum: response['luas_yuridisBlm'],
              luasPembayaranSpp: response['luas_bayarSdh'],
              luasPembayaranSppBelum: response['luas_bayarBlm'],
              luasPenyerahanHasil: response['luas_bayarSdh'],
              ///total bidang belum lengkap
              bidangLengkap: response['eligibel'],
              ///total nilai
              nilaiApraisal: response['nilai_apraisal'],
              nilaiMusyawarahBlm: response['nilai_musyawarahBlm'],
              nilaiMusyawarahSdh: response['nilai_musyawarahSdh'],
              nilaiValSdh: response['nilai_validasiSdh'],
              nilaiValBlm: response['nilai_validasiBlm'],
              nilaiSppSdh: response['nilai_sppSdh'],
              nilaiSppBlm: response['nilai_sppBlm'],
              nilaiYuridisSdh: response['nilai_yuridisSdh'],
              nilaiYuridisBlm: response['nilai_yuridisBlm'],
              nilaiBayarSdh: response['nilai_bayarSdh'],
              nilaiBayarBlm: response['nilai_bayarBlm'],

              ///Total kelengkapan dokumen
              penlokLengkap: response['penlok'],
              danomLengkap: response['danom'],
              identitasLengkap: response['identitas'],
              alasHakLengkap: response['dah'],
              petaLengkap: response['peta'],
              dokPendukungLengkap: response['doklain'],

              ///total Issue
              issueLebakOpen: response['issue_lebak_open'],
              issueLebakClose: response['issue_lebak_close'],
              issueSerangOpen: response['issue_serang_open'],
              issueSerangClose: response['issue_serang_close'],
              issueTangeOpen: response['issue_tang_open'],
              issueTangeClose: response['issue_tang_close'],

              // bidangKurang: response['uneligible'],
              ///total kekurangan berkas
              kurangPenlok: response['k_penlok_r'],
              kurangDNominatif: response['k_dn_r'],
              kurangValidasiP2t: response['k_p2t_r'],
              kurangSpp: response['spp_rr'],
              kurangIdentitas: response['k_identitas_r'],
              kurangAlasHak: response['k_ah_r'],
              kurangPeta: response['k_peta_r'],
              kurangApraisal: response['k_lhp_r'],
              kurangPendukung: response['k_dpl_r'],
              kurangSptjp: response['k_sptjp_r'],
            )
        );
        // print('sukses nih');
        // print('DATA kurangPenlok ${response['k_penlok_r']}');
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