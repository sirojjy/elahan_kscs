import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../bloc/dashboard_bloc.dart';

class BarChartKelengkapan extends StatefulWidget {
  const BarChartKelengkapan({Key? key}) : super(key: key);

  @override
  State<BarChartKelengkapan> createState() => _BarChartKelengkapanState();
}

class _BarChartKelengkapanState extends State<BarChartKelengkapan> {
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
            {'year': 'Dok Pendukung', 'sales': state.dokPendukungLengkap ?? 0, 'sales2': state.kurangPendukung ?? 0},
            {'year': 'Peta Bidang', 'sales': state.petaLengkap ?? 0, 'sales2': state.kurangPeta ?? 0},
            {'year': 'Dok. Alas Hak', 'sales': state.alasHakLengkap ?? 0, 'sales2': state.kurangAlasHak ?? 0},
            {'year': 'Identitas \nPenerima', 'sales': state.identitasLengkap ?? 0, 'sales2': state.kurangIdentitas ?? 0},
            {'year': 'Daftar \nNominatif', 'sales': state.danomLengkap ?? 0, 'sales2': state.kurangDNominatif ?? 0},
            {'year': 'Penlok', 'sales': state.penlokLengkap ?? 0, 'sales2': state.kurangPenlok ?? 0},
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
            height: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SfCartesianChart(
                // Initialize category axis
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),
                  title: ChartTitle(text: 'Kelengkapan Dokumen'),
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
                        name: 'Terupload',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        dataSource: getChartData(),
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales),
                    StackedBarSeries(
                        name: 'Belum Terupload',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
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
  SalesData({required this.year, this.sales, this.sales2});

  final String year;
  final double? sales;
  final double? sales2;
}
