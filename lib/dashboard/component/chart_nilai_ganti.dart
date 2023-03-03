import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartNilaiGanti extends StatefulWidget {
  const ChartNilaiGanti({Key? key}) : super(key: key);

  @override
  State<ChartNilaiGanti> createState() => _ChartNilaiGantiState();
}

class _ChartNilaiGantiState extends State<ChartNilaiGanti> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    dataSource: <SalesData>[
                      SalesData('Penyerahan \nHasil', 0, 0),
                      SalesData('Pembayaran', 0, 0),
                      SalesData('Yuridis', 0, 0),
                      SalesData('Usulan SPP', 8000000000, 800000000),
                      SalesData('Validasi BPN', 8000000000, 800000000),
                      SalesData('Musyawarah', 10000000000, 1000000000),
                      SalesData('Apraisal', 10000000000, 1000000000),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales),
                StackedBarSeries(
                    name: 'Belum Realisasi',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    dataSource: <SalesData>[
                      SalesData('Penyerahan \nHasil', 0, 0),
                      SalesData('Pembayaran', 0, 0),
                      SalesData('Yuridis', 0, 0),
                      SalesData('Usulan SPP', 8000000000, 800000000),
                      SalesData('Validasi BPN', 8000000000, 800000000),
                      SalesData('Musyawarah', 10000000000, 1000000000),
                      SalesData('Apraisal', 10000000000, 1000000000),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales2)
              ]),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales, this.sales2);
  final String year;
  final double sales;
  final double sales2;
}
