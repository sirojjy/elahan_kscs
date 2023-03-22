import 'package:elahan_kscs/dashboard/component/bar_chart_kelengkapan.dart';
import 'package:elahan_kscs/dashboard/component/chart_durasi_waktu.dart';
import 'package:elahan_kscs/dashboard/component/chart_jumlah_bidang.dart';
import 'package:elahan_kscs/dashboard/component/donut_bidang_lengkap.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_full.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_serang.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_tangerang.dart';
import 'package:elahan_kscs/dashboard/component/pie_kekurangan_berkas.dart';
import 'package:flutter/material.dart';

import '../component/bar_chart_issue.dart';
import '../component/chart_luas_bidang.dart';
import '../component/chart_nilai_ganti.dart';
import '../component/pie_chart.dart';

class TotalProgresKeseluruhan extends StatelessWidget {
  const TotalProgresKeseluruhan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children:  [
                const ChartJumlahBidang(),
                const SizedBox(height: 10,),

                const ChartLuasBidang(),
                const SizedBox(height: 10,),

                const ChartNilaiGanti(),
                const SizedBox(height: 10,),

                const ChartDurasiWaktu(),
                const SizedBox(height: 10,),

                BarChartIssue(),
                SizedBox(height: 10,),

                BarChartKelengkapan(),
                SizedBox(height: 10,),

                DonutBidangLengkap(),
                const SizedBox(height: 10,),

                const PieKekuranganBerkas(),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
