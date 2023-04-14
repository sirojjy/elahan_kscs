import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class ChartLuasBidang extends StatefulWidget {
  const ChartLuasBidang({Key? key}) : super(key: key);

  @override
  State<ChartLuasBidang> createState() => _ChartLuasBidangState();
}

class _ChartLuasBidangState extends State<ChartLuasBidang> {
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
              {'year': 'Penyerahan \nHasil', 'sales': state.luasPembayaranSpp ?? 0, 'sales2': 0},
              {'year': 'Pembayaran', 'sales': state.luasPembayaranSpp ?? 0, 'sales2': state.luasPembayaranSppBelum ?? 0},
              {'year': 'Yuridis', 'sales': state.luasYuridis ?? 0, 'sales2': state.luasYuridisBelum ?? 0},
              {'year': 'Usulan SPP', 'sales': state.luasSpp ?? 0, 'sales2': state.luasSppBelum ?? 0},
              {'year': 'Validasi', 'sales': state.luasValidasi ?? 0, 'sales2': state.luasValidasiBelum ?? 0},
              {'year': 'Musyawarah', 'sales': state.luasMusyawarah ?? 0, 'sales2': state.luasMusyawarahBelum ?? 0},
              {'year': 'Apraisal', 'sales': state.luasApraisal ?? 0, 'sales2': state.luasApraisalBelum ?? 0},
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
              height: 370,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SfCartesianChart(
                  // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    title: ChartTitle(text: 'Total Luas Bidang'),
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
                    ]
                ),
              ));
        });
  }
}

class SalesData {
  SalesData({required this.year, this.sales, this.sales2});
  final String year;
  final double? sales;
  final double? sales2;
}