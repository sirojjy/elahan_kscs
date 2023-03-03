import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonutChart extends StatelessWidget {
  var _tooltipBehavior;
  DonutChart({Key? key}) : super(key: key);

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
        title: ChartTitle(text: 'Progres Pengadaan Tanah (luas)'),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          DoughnutSeries<DataLuasTanah, String>(
            dataSource: dataKategoriCard(),
            xValueMapper: (DataLuasTanah data, _) => data.bebas,
            yValueMapper: (DataLuasTanah data, _) => data.belumBebas,
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
    {'Luas': 28, 'label': 'Bebas'},
    {'Luas': 72, 'label': 'Belum Bebas'},
  ];
  for (var i = 0; i < listData.length; i++) {
    chartData.add(DataLuasTanah(
        bebas: listData[i]['label'].toString(),
        belumBebas: double.parse(listData[i]['Luas'].toString())));
  }
  return chartData;
}

class DataLuasTanah {
  final String? bebas;
  final double? belumBebas;
  DataLuasTanah({this.bebas, this.belumBebas});
}
