import 'package:elahan_kscs/dashboard/component/pie_cart_full.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartIssue extends StatefulWidget {
  const BarChartIssue({Key? key}) : super(key: key);

  @override
  State<BarChartIssue> createState() => _BarChartIssueState();
}

class _BarChartIssueState extends State<BarChartIssue> {
  @override
  void initState() {
    // _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(left: 10,right: 10),
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
        height: 230,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SfCartesianChart(
            // Initialize category axis
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              title: ChartTitle(text: 'Jumlah Issue/Permasalahan'),
              legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  // title: LegendTitle(text: 'Jumlah Kekurangan')
              ),
              palette: const <Color>[
                Color(0xFF199BED),
                Color(0xFFFF6954),
              ],
              series: <ChartSeries<SalesData, String>>[
                StackedBarSeries(
                  name: 'CLose',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                    dataSource: <SalesData>[
                      SalesData('Kab. Lebak', 35, 20),
                      SalesData('Kab. Serang', 28, 20),
                      SalesData('Kab. \nTangerang', 34, 20),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales
                ),
                StackedBarSeries(
                    name: 'Open',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    dataSource: <SalesData>[
                      SalesData('Kab. Lebak', 35, 20),
                      SalesData('Kab. Serang', 28, 20),
                      SalesData('Kab. \nTangerang', 34, 20),
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales2
                )
              ]
          ),
        )
    );
  }
}

// List<SalesData> getChartData() {
//   var chartData = <IssueData>[];
//   var listData=[
//     {'kabupaten' :
//   ]
// }

class SalesData {
  SalesData(this.year, this.sales, this.sales2);

  final String year;
  final double sales;
  final double sales2;
}


