import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieKekuranganBerkas extends StatefulWidget {
  const PieKekuranganBerkas({Key? key}) : super(key: key);

  @override
  State<PieKekuranganBerkas> createState() => _PieKekuranganBerkasState();
}

class _PieKekuranganBerkasState extends State<PieKekuranganBerkas> {
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
      height: 340,
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
          Color(0xffFF703B),
          Color(0xffFF377B),
          Color(0xff9B27AF),
          Color(0xff586ACD),
          Color(0xffA3E0FB),
          Color(0xff06AC9C),
          Color(0xff65C769),
          Color(0xffA3DB63),
          Color(0xffE5F452),
          Color(0xffFFFF54),
        ],
        title: ChartTitle(text: 'Klasifikasi Jenis Tanah Kabupaten Lebak'),
        // legend:
        //     Legend(isVisible: true, position: LegendPosition.bottom),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<IssueData, String>(
            radius: '70%',
            dataSource: _chartData,
            xValueMapper: (IssueData data, _) => data.label,
            yValueMapper: (IssueData data, _) => data.nilai,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                labelIntersectAction: LabelIntersectAction.shift,
                connectorLineSettings: ConnectorLineSettings(
                    type: ConnectorType.curve, length: '15%'),
            ),
            dataLabelMapper: (IssueData data, _) => data.label,
            enableTooltip: true,
          )
        ],
      ),
    );
  }
}

List<IssueData> getChartData() {
  var chartData = <IssueData>[];
  var listData = [
    {'data': 27, 'label': 'Penlok'},
    {'data': 7, 'label': 'Nominatif'},
    {'data': 15, 'label': 'Validasi P2T'},
    {'data': 10, 'label': 'SPP'},
    {'data': 3, 'label': 'Identitas'},
    {'data': 3, 'label': 'Alas Hak'},
    {'data': 3, 'label': 'Peta Bidang'},
    {'data': 3, 'label': 'Apraisal'},
    {'data': 3, 'label': 'Dok. Pendukung'},
    {'data': 3, 'label': 'SPTJP'},
  ];
  for (var i = 0; i < listData.length; i++) {
    chartData.add(IssueData(
        label: listData[i]['label'].toString(),
        nilai: double.parse(listData[i]['data'].toString())));
  }

  return chartData;
}

class IssueData {
  final String? label;
  final double? nilai;

  IssueData({this.label, this.nilai});
}
