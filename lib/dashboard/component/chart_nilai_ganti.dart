import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class ChartNilaiGanti extends StatefulWidget {
  const ChartNilaiGanti({Key? key}) : super(key: key);

  @override
  State<ChartNilaiGanti> createState() => _ChartNilaiGantiState();
}

class _ChartNilaiGantiState extends State<ChartNilaiGanti> {
  SharedPreferences? pref;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(ViewDashboardEvent());
    getPref;
  }
  void getPref() async {pref = await SharedPreferences.getInstance();}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
        builder: (context, state){
          List<SalesData> getChartData() {
            var chartData = <SalesData>[];
            var listData = [
              {'year': 'Penyerahan \nHasil', 'sales': state.nilaiBayarSdh ?? 0, 'sales2': 0},
              {'year': 'Pembayaran', 'sales': state.nilaiBayarSdh ?? 0, 'sales2': state.nilaiBayarBlm ?? 0},
              {'year': 'Yuridis', 'sales': state.nilaiYuridisSdh ?? 0, 'sales2': state.nilaiYuridisBlm ?? 0},
              {'year': 'Usulan SPP', 'sales': state.nilaiSppSdh ?? 0, 'sales2': state.nilaiSppBlm ?? 0},
              {'year': 'Validasi', 'sales': state.nilaiValSdh ?? 0, 'sales2': state.nilaiValBlm ?? 0},
              {'year': 'Musyawarah', 'sales': state.nilaiMusyawarahSdh ?? 0, 'sales2': state.nilaiMusyawarahBlm ?? 0},
              {'year': 'Apraisal', 'sales': state.nilaiApraisal ?? 0, 'sales2': 0},
              {'year': 'Pagu Dana', 'sales': 0, 'sales2': 0},
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
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    title: ChartTitle(text: 'Total Nilai Ganti Kerugian'),
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
        }
    );
  }
}

class SalesData {
  SalesData({required this.year, this.sales, this.sales2});
  final String year;
  final double? sales;
  final double? sales2;
}
