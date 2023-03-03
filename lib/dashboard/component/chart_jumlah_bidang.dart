import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartJumlahBidang extends StatefulWidget {
  const ChartJumlahBidang({Key? key}) : super(key: key);

  @override
  State<ChartJumlahBidang> createState() => _ChartJumlahBidangState();
}

class _ChartJumlahBidangState extends State<ChartJumlahBidang> {
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
                      SalesData('Penyerahan \nHasil', 0, 0),
                      SalesData('Pembayaran', 0, 0),
                      SalesData('Yuridis', 0, 0),
                      SalesData('Usulan SPP', 34, 20),
                      SalesData('Validasi BPN', 34, 20),
                      SalesData('Musyawarah', 34, 20),
                      SalesData('Apraisal', 34, 20),
                      SalesData('Pengumuman', 45, 10),
                      SalesData('Inventarisasi', 55, 0),
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
                      SalesData('Usulan SPP', 34, 20),
                      SalesData('Validasi BPN', 34, 20),
                      SalesData('Musyawarah', 34, 20),
                      SalesData('Apraisal', 34, 20),
                      SalesData('Pengumuman', 45, 10),
                      SalesData('Inventarisasi', 55, 0),
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
