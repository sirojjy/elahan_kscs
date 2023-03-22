import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartFull extends StatefulWidget {
  const PieChartFull({Key? key}) : super(key: key);

  @override
  State<PieChartFull> createState() => _PieChartFullState();
}

// class _PieChartFullState extends State<PieChartFull> {
//   var _chartData;
//   var _tooltipBehavior;
//   @override
//   void initState() {
//     _chartData = getChartData();
//     _tooltipBehavior = TooltipBehavior(enable: true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('Data Jenis Tanah');
//     return Container(
//       height: 250,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(0, 3),
//             ),
//           ]),
//       child: SfCircularChart(
//         palette: const [
//           Color(0xff1BA1CC),
//           Color(0xff2672EB),
//           Color(0xffFF7724),
//           Color(0xffFFE646),
//           Color(0xff1DD346),
//         ],
//         title: ChartTitle(text: 'Klasifikasi Jenis Tanah Kabupaten Lebak'),
//         legend:
//         Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
//         tooltipBehavior: _tooltipBehavior,
//         series: <CircularSeries>[
//           PieSeries<IssueData, String>(
//             dataSource: _chartData,
//             xValueMapper: (IssueData data, _) => data.label,
//             yValueMapper: (IssueData data, _) => data.nilai,
//             dataLabelSettings: const DataLabelSettings(isVisible: true),
//             enableTooltip: true,
//           )
//         ],
//       ),
//     );
//   }
// }

class _PieChartFullState extends State<PieChartFull> {
  SharedPreferences? pref;
  // var _chartData;
  var _tooltipBehavior;
  @override
  void initState() {
    // _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    BlocProvider.of<DashboardBloc>(context).add(ViewDashboardEvent());
    getPref();
  }
  void getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
        builder: (context, state){
        // print('Data Kategori Tanah Usaha Lebak ${state.tanahUsahaLebak}');
        List<IssueData> getChartData() {
          var chartData = <IssueData>[];
          var listData = [
            {'data': state.tanahOrangLebak ?? 0, 'label': 'Tanah Warga'},
            {'data': state.tanahUsahaLebak ?? 0, 'label': 'Tanah Perusahaan'},
            {'data': state.tanahPemeLebak ?? 0, 'label': 'Tanah Pemerintah'},
            {'data': state.tanahWakafLebak ?? 0, 'label': 'Tanah Wakaf'},
            {'data': state.tanahTkdLebak ?? 0, 'label': 'Tanah Kas Desa'},
            {'data': 0, 'label': 'Lainnya'},
          ];
          for (var i = 0; i < listData.length; i++) {
            chartData.add(IssueData(
                label: listData[i]['label'].toString(),
                nilai: double.parse(listData[i]['data'].toString())));
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
              title: ChartTitle(text: 'Klasifikasi Jenis Tanah Kabupaten Lebak'),
              legend:
              Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                PieSeries<IssueData, String>(
                  dataSource: getChartData(),
                  xValueMapper: (IssueData data, _) => data.label,
                  yValueMapper: (IssueData data, _) => data.nilai,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                )
              ],
            ),
          );
        });
  }
}

class IssueData {
  final String? label;
  final double? nilai;

  IssueData({this.label, this.nilai});
}
