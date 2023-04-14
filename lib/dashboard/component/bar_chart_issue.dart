import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:elahan_kscs/dashboard/component/pie_cart_full.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartIssue extends StatefulWidget {
  const BarChartIssue({Key? key}) : super(key: key);

  @override
  State<BarChartIssue> createState() => _BarChartIssueState();
}

class _BarChartIssueState extends State<BarChartIssue> {
  SharedPreferences? pref;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(ViewDashboardEvent());
    getPref;
  }

  void getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
      builder: (context, state) {
        List<SalesData> getChartData() {
          var chartData = <SalesData>[];
          var listData = [
            {'year': 'Kab. \nTangerang', 'sales': 0, 'sales2': 0},
            {'year': 'Kab, Serang', 'sales': 0, 'sales2': 0},
            {'year': 'Kab. Lebak', 'sales': 0, 'sales2': 0}
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
                        dataSource: getChartData(),
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales),
                    StackedBarSeries(
                        name: 'Open',
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

// List<SalesData> getChartData() {
//   var chartData = <IssueData>[];
//   var listData=[
//     {'kabupaten' :
//   ]
// }

class SalesData {
  SalesData({required this.year, this.sales, this.sales2});

  final String year;
  final double? sales;
  final double? sales2;
}
