import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartTangerang extends StatefulWidget {
  const PieChartTangerang({Key? key}) : super(key: key);

  @override
  State<PieChartTangerang> createState() => _PieChartTangerangState();
}

class _PieChartTangerangState extends State<PieChartTangerang> {
  var _chartData;
  var _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
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
        palette: const [
          Color(0xff1BA1CC),
          Color(0xff2672EB),
          Color(0xffFF7724),
          Color(0xffFFE646),
          Color(0xff1DD346),
        ],
        title: ChartTitle(text: 'Klasifikasi Jenis Tanah Kabupaten Tangerang'),
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
}

List<IssueData> getChartData() {
  var  chartData = <IssueData>[];
  var listData = [
    {'data': 44, 'label': 'Tanah Warga'},
    {'data': 10, 'label': 'Tanah Instansi'},
    {'data': 15, 'label': 'Tanah Wakaf'},
    {'data': 12, 'label': 'Tanah Kas Desa'},
    {'data': 5, 'label': 'Lainnya'},
  ];
  for(var i = 0; i<listData.length; i++){
    chartData.add(IssueData(
        label:listData[i]['label'].toString(),
        nilai:double.parse(listData[i]['data'].toString())
    ));
  }

  return chartData;
}

class IssueData {
  final String? label;
  final double? nilai;

  IssueData({this.label, this.nilai});
}
