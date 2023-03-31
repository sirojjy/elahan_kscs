import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartLuasBidang extends StatefulWidget {
  const ChartLuasBidang({Key? key}) : super(key: key);

  @override
  State<ChartLuasBidang> createState() => _ChartLuasBidangState();
}

class _ChartLuasBidangState extends State<ChartLuasBidang> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
        builder: (context, state) {
        List<SalesData> getChartData() {
          var chartData = <SalesData>[];
          var listData = [
            {'year': 'Penyerahan \nHasil', 'sales': state.hasilReal ?? 0, 'sales2': state.hasilBelum},
            {'year': 'Pembayaran', 'sales': state.pembayaranReal ?? 0, 'sales2': state.pembayaranBelum},
            {'year': 'Yuridis', 'sales': state.yuridisReal ?? 0, 'sales2': state.yuridisBelum},
            {'year': 'Usulan SPP', 'sales': state.sppReal ?? 0, 'sales2': state.sppBelum},
            {'year': 'Validasi BPN', 'sales': state.validasiReal ?? 0, 'sales2': state.validasiBelum},
            {'year': 'Musyawarah', 'sales': state.musyawarahReal ?? 0, 'sales2': state.musyawarahBelum},
            {'year': 'Apraisal', 'sales': state.apraisalReal ?? 0, 'sales2': state.apraisalBelum},
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
                          dataSource: getChartData(),
                          // [
                          //   SalesData('Penyerahan \nHasil', 0, 0),
                          //   SalesData('Pembayaran \nSPP', 34, 20),
                          //   SalesData('Yuridis', 34, 20),
                          //   SalesData('Usulan SPP', 34, 20),
                          //   SalesData('Validasi', 34, 20),
                          //   SalesData('Musyawarah', 45, 10),
                          //   SalesData('Apraisal', 55, 0),
                          // ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                      StackedBarSeries(
                          name: 'Belum Realisasi',
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          dataSource: getChartData(),
                          // [
                          //   SalesData('Penyerahan \nHasil', 0, 0),
                          //   SalesData('Pembayaran \nSPP', 34, 20),
                          //   SalesData('Yuridis', 34, 20),
                          //   SalesData('Usulan SPP', 34, 20),
                          //   SalesData('Validasi', 34, 20),
                          //   SalesData('Musyawarah', 45, 10),
                          //   SalesData('Apraisal', 55, 0),
                          // ],
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
