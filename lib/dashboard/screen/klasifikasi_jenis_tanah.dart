import 'package:elahan_kscs/dashboard/component/bar_chart_kelengkapan.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_full.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_serang.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_tangerang.dart';
import 'package:flutter/material.dart';

import '../component/bar_chart_issue.dart';
import '../component/pie_chart.dart';

class KlasifikasiJenisTanah extends StatelessWidget {
  const KlasifikasiJenisTanah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //     child: Container(
          //       child: PieChartFull(),
          //     )
          // ),
          // const SizedBox(height: 10,),
          // Expanded(
          //     child: Container(
          //       child: PieChartTangerang(),
          //     )
          // ),
          // const SizedBox(height: 10,),
          // Expanded(
          //     child: Container(
          //       child: PieChartSerang(),
          //     )
          // ),
          // const SizedBox(height: 10,),

          Expanded(
            child: Column(
              children: const [
                // PieChartComponent(),
                // SizedBox(height: 10,),
                PieChartFull(),
                SizedBox(height: 10,),

                PieChartTangerang(),
                SizedBox(height: 10,),

                PieChartSerang(),
                SizedBox(height: 10,),

                BarChartIssue(),
                SizedBox(height: 10,),

                BarChartKelengkapan(),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
