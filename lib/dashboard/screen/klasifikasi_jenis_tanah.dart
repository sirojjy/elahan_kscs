import 'package:elahan_kscs/dashboard/component/bar_chart_kelengkapan.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_full.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_serang.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_tangerang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/dashboard_bloc.dart';
import '../component/bar_chart_issue.dart';
import '../component/pie_chart.dart';

class KlasifikasiJenisTanah extends StatefulWidget {
  const KlasifikasiJenisTanah({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _KlasifikasiJenisTanah();
}

class _KlasifikasiJenisTanah extends State<KlasifikasiJenisTanah> {
  SharedPreferences? pref;

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<DashboardBloc>(context).add(ViewDashboardEvent());
    getPref();
  }

  void getPref() async {pref = await SharedPreferences.getInstance();}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      // PieChartComponent(),
                      // SizedBox(height: 10,),
                      PieChartFull(),
                      SizedBox(height: 10,),

                      PieChartSerang(),
                      SizedBox(height: 10,),

                      PieChartTangerang(),
                      SizedBox(height: 10,),

                      // BarChartIssue(),
                      // SizedBox(height: 10,),

                      // BarChartKelengkapan(),
                      // SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }


}


