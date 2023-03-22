import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


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
                        dataSource: <SalesData>[
                          SalesData('Penyerahan \nHasil', 42, 0),
                          SalesData('Pembayaran', 42, 4),
                          SalesData('Yuridis', 43, 3),
                          SalesData('Usulan SPP', 46, 1),
                          SalesData('Validasi BPN', 47, 1),
                          SalesData('Musyawarah', 48, 1),
                          SalesData('Apraisal', 278, 49),
                          SalesData('Pengumuman', 278, 49),
                          SalesData('Inventarisasi', 327, 100),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales),
                    StackedBarSeries(
                        name: 'Belum Realisasi',
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        dataSource: <SalesData>[
                          SalesData('Penyerahan \nHasil', 42, 0),
                          SalesData('Pembayaran', 42, 4),
                          SalesData('Yuridis', 43, 3),
                          SalesData('Usulan SPP', 46, 1),
                          SalesData('Validasi BPN', 47, 1),
                          SalesData('Musyawarah', 48, 1),
                          SalesData('Apraisal', 278, 49),
                          SalesData('Pengumuman', 278, 49),
                          SalesData('Inventarisasi', 327, 0),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales2)
                  ]),
            ));
      },
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales, this.sales2);
  final String year;
  final double? sales;
  final double? sales2;
}
