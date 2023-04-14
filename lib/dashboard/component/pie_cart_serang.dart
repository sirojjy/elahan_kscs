import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class PieChartSerang extends StatefulWidget {
  const PieChartSerang({Key? key}) : super(key: key);

  @override
  State<PieChartSerang> createState() => _PieChartSerangState();
}

class _PieChartSerangState extends State<PieChartSerang> {
  var _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
      builder: (context, state) {
        List<IssueData> getChartData() {
          var  chartData = <IssueData>[];
          var listData = [
            {'data': state.tanahOrangSerang ?? 0, 'label': 'Tanah Warga'},
            {'data': state.tanahUsahaSerang ?? 0, 'label': 'Tanah Perusahaan'},
            {'data': state.tanahPemeSerang ?? 0, 'label': 'Tanah Pemerintah'},
            {'data': state.tanahWakafSerang ?? 0, 'label': 'Tanah Wakaf'},
            {'data': state.tanahTkdSerang ?? 0, 'label': 'Tanah Kas Desa'},
            {'data': 0, 'label': 'Lainnya'},
          ];
          for(var i = 0; i<listData.length; i++){
            chartData.add(IssueData(
                label:listData[i]['label'].toString(),
                nilai:double.parse(listData[i]['data'].toString())
            ));
          }
          return chartData;
        }
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
            palette: const [
              Color(0xff1BA1CC),
              Color(0xff2672EB),
              Color(0xffFF7724),
              Color(0xffFFE646),
              Color(0xff1DD346),
              Color(0xffe14832),
            ],
            title: ChartTitle(text: 'Klasifikasi Jenis Tanah Kabupaten Serang'),
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,

            series: <CircularSeries>[
              PieSeries<IssueData, String>(
                dataSource: getChartData(),
                xValueMapper: (IssueData data, _) => data.label,
                yValueMapper: (IssueData data, _) => data.nilai,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true,
                dataLabelMapper: (IssueData data, _) {
                  final format = NumberFormat('#,##0', 'id_ID');
                  return '${format.format(data.nilai)}';
                },
              )
            ],
          ),
        );
      },
    );
  }
}



class IssueData {
  final String? label;
  final double? nilai;

  IssueData({this.label, this.nilai});
}
