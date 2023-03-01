import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartComponent extends StatelessWidget {
  var _chartData;
  var _tooltipBehavior;
  PieChartComponent({Key? key}) : super(key: key);

  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
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
      child: SfCircularChart(
        title: ChartTitle(text: 'Klasifikasi Jenis Tanah Kabupaten Lebak'),
        legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<IssueData, String>(
            dataSource: _chartData,
            xValueMapper: (IssueData data, _) => data.label,
            yValueMapper: (IssueData data, _) => data.nilai,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
          )
        ],
      ),
    );
  }
  List<IssueData> getChartData() {
    var  chartData = <IssueData>[];
    var listData = [
      {'data': 20, 'label': 'Tanah Warga'},
      {'data': 80, 'label': 'Tanah Instansi'},
      {'data': 80, 'label': 'Tanah Wakaf'},
      {'data': 80, 'label': 'Tanah Kas Desa'},
      {'data': 80, 'label': 'Lainnya'},
    ];
    for(var i = 0; i<listData.length; i++){
      chartData.add(IssueData(
          label:listData[i]['label'].toString(),
          nilai:double.parse(listData[i]['data'].toString())
      ));
    }

    return chartData;
  }
}

class IssueData {
  final String? label;
  final double? nilai;

  IssueData({this.label, this.nilai});
}
