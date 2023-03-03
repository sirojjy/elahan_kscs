import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartKelengkapan extends StatefulWidget {
  const BarChartKelengkapan({Key? key}) : super(key: key);

  @override
  State<BarChartKelengkapan> createState() => _BarChartKelengkapanState();
}

class _BarChartKelengkapanState extends State<BarChartKelengkapan> {
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
                    dataSource: <SalesData>[
                      SalesData('Dok. \nPendukung', 34, 20),
                      SalesData('Peta Bidang', 34, 20),
                      SalesData('Alas Hak', 34, 20),
                      SalesData('Identitas \nPenerima', 34, 20),
                      SalesData('Daftar \nNominatif', 45, 10),
                      SalesData('Penlok', 55, 0),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales),
                StackedBarSeries(
                    name: 'Belum Terupload',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    dataSource: <SalesData>[
                      SalesData('Dok. \nPendukung', 34, 20),
                      SalesData('Peta Bidang', 34, 20),
                      SalesData('Alas Hak', 34, 20),
                      SalesData('Identitas \nPenerima', 34, 20),
                      SalesData('Daftar \nNominatif', 45, 10),
                      SalesData('Penlok', 55, 0),
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
