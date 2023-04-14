import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class ChartDurasiWaktu extends StatefulWidget {
  const ChartDurasiWaktu({Key? key}) : super(key: key);

  @override
  State<ChartDurasiWaktu> createState() => _ChartDurasiWaktuState();
}

class _ChartDurasiWaktuState extends State<ChartDurasiWaktu> {
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
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              title: ChartTitle(text: 'Durasi Waktu Rata-rata (hari)'),
              // legend: Legend(
              //   isVisible: true,
              //   title: LegendTitle(text: 'Durasi Rata-rata (hari)'),
              //     // isVisible: true,
              //     position: LegendPosition.bottom
              // ),
              palette: const <Color>[
                Color(0xFF199BED),
                Color(0xFFFF6954),
              ],
              series: <StackedBarSeries<SalesData, String>>[
                StackedBarSeries(
                    name: 'Hari',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    dataLabelMapper: (SalesData data, _) {
                      final format = NumberFormat('#,##0', 'id_ID');
                      return '${format.format(data.sales)}';
                    },
                    dataSource: <SalesData>[
                      SalesData('Pembayaran-\nPenyerahan Hasil', 0),
                      SalesData('Usulan SPP-\nPembayaran', 1),
                      SalesData('Validasi-\nUsulan SPP', 7),
                      SalesData('Musyawarah-\nValidasi', 1),
                      SalesData('Apraisal-\nMusyawarah', 1),
                      SalesData('Inventarisasi-\nApraisal', 27),
                      SalesData('Penlok-\nInventarisasi', 15),
                      SalesData('Konsultasi \nPublik-Penlok', 20),
                      SalesData('DPPT-Konsultasi \nPublik', 30),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales),

              ]
          ),
        ));
  }
}

class SalesData {
  SalesData(
      this.year,
      this.sales,
      // this.sales2
      );
  final String year;
  final double sales;
  // final double sales2;
}
