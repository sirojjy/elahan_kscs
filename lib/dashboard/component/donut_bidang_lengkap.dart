import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonutBidangLengkap extends StatelessWidget {
  var _tooltipBehavior;
  DonutBidangLengkap({Key? key}) : super(key: key);

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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
        palette: const [Color(0xff1d84d7), Color(0xfffd8530)],
        title: ChartTitle(text: 'Progres Pengadaan Tanah (bidang)'),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<DataLuasTanah, String>(
            dataSource: dataKategoriCard(),
            xValueMapper: (DataLuasTanah data, _) => data.bebas,
            yValueMapper: (DataLuasTanah data, _) => data.belumLengkap,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
          )
        ],
      ),
    );
  }
}

List<DataLuasTanah> dataKategoriCard() {
  var chartData = <DataLuasTanah>[];
  var listData = [
    {'bidang': 22, 'label': 'Lengkap'},
    {'bidang': 78, 'label': 'Belum Lengkap'},
  ];
  for (var i = 0; i < listData.length; i++) {
    chartData.add(DataLuasTanah(
        bebas: listData[i]['label'].toString(),
        belumLengkap: double.parse(listData[i]['bidang'].toString())));
  }
  return chartData;
}

class DataLuasTanah {
  final String? bebas;
  final double? belumLengkap;
  DataLuasTanah({this.bebas, this.belumLengkap});
}
