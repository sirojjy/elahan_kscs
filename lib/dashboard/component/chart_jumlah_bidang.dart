import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class ChartJumlahBidang extends StatefulWidget {
  const ChartJumlahBidang({Key? key}) : super(key: key);

  @override
  State<ChartJumlahBidang> createState() => _ChartJumlahBidangState();
}

class _ChartJumlahBidangState extends State<ChartJumlahBidang> {
  SharedPreferences? pref;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(ViewDashboardEvent());
    getPref();
  }
  void getPref() async {pref = await SharedPreferences.getInstance();}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
      builder: (context, state) {
        List<SalesData> getChartData() {
          var chartData = <SalesData>[];
          var listData = [
            {'year': 'Penyerahan \nHasil', 'sales': state.hasilReal ?? 0, 'sales2': state.hasilBelum ?? 0},
            {'year': 'Pembayaran', 'sales': state.pembayaranReal ?? 0, 'sales2': state.pembayaranBelum ?? 0},
            {'year': 'Yuridis', 'sales': state.yuridisReal ?? 0, 'sales2': state.yuridisBelum ?? 0},
            {'year': 'Usulan SPP', 'sales': state.sppReal ?? 0, 'sales2': state.sppBelum ?? 0},
            {'year': 'Validasi BPN', 'sales': state.validasiReal ?? 0, 'sales2': state.validasiBelum ?? 0},
            {'year': 'Musyawarah', 'sales': state.musyawarahReal ?? 0, 'sales2': state.musyawarahBelum ?? 0},
            {'year': 'Apraisal', 'sales': state.apraisalReal ?? 0, 'sales2': state.apraisalBelum ?? 0},
            {'year': 'Pengumuman', 'sales': state.inventarisasiReal ?? 0, 'sales2': 0},
            {'year': 'Inventarisasi', 'sales': state.inventarisasiReal ?? 0, 'sales2': 0},
          ];
          for (var i = 0; i < listData.length; i++) {
            chartData.add(SalesData(
              year: listData[i]['year'].toString(),
              sales: double.parse(listData[i]['sales'].toString()),
              sales2: double.parse(listData[i]['sales2'].toString()),
            ));
            // nilai: double.parse(listData[i]['data'].toString())));
          }

          return chartData;
        }

        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ]),
            height: 450,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SfCartesianChart(
                // Initialize category axis
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),
                  title: ChartTitle(text: 'Total Jumlah Bidang'),
                  legend: Legend(
                      isVisible: true,
                      position: LegendPosition.bottom
                  ),
                  palette: const <Color>[
                    Color(0xFF199BED),
                    Color(0xFFFF6954),
                  ],
                  series: <StackedBarSeries<SalesData, String>>[
                    StackedBarSeries(
                        name: 'Sudah Realisasi',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        dataLabelMapper: (SalesData data, _) {
                          final format = NumberFormat('#,##0', 'id_ID');
                          return '${format.format(data.sales)}';
                        },
                        dataSource: getChartData(),
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales),
                    StackedBarSeries(
                        name: 'Belum Realisasi',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        dataLabelMapper: (SalesData data, _) {
                          final format = NumberFormat('#,##0', 'id_ID');
                          return '${format.format(data.sales2)}';
                        },
                        dataSource: getChartData(),
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales2)
                  ]),
            ));
      },
    );
  }
}

class SalesData {

  final String year;
  final double? sales;
  final double? sales2;
  SalesData({required this.year, this.sales, this.sales2});
}