import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieKekuranganBerkas extends StatefulWidget {
  const PieKekuranganBerkas({Key? key}) : super(key: key);

  @override
  State<PieKekuranganBerkas> createState() => _PieKekuranganBerkasState();
}

class _PieKekuranganBerkasState extends State<PieKekuranganBerkas> {
  // var _chartData;
  var _tooltipBehavior;
  @override
  void initState() {
    // _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context)..add(ViewDashboardEvent()),
      builder: (context, state) {
        List<IssueData> getChartData() {
          var chartData = <IssueData>[];
          var listData = [
            {'data': state.kurangPenlok, 'label': 'Penlok'},
            {'data': state.kurangDNominatif, 'label': 'Nominatif'},
            {'data': state.kurangValidasiP2t, 'label': 'Validasi P2T'},
            {'data': state.kurangSpp, 'label': 'SPP'},
            {'data': state.kurangIdentitas, 'label': 'Identitas'},
            {'data': state.kurangAlasHak, 'label': 'Alas Hak'},
            {'data': state.kurangPeta, 'label': 'Peta Bidang'},
            {'data': state.kurangApraisal, 'label': 'Apraisal'},
            {'data': state.kurangPendukung, 'label': 'Dok. Pendukung'},
            {'data': state.kurangSptjp, 'label': 'SPTJP'},
          ];
          for (var i = 0; i < listData.length; i++) {
            chartData.add(IssueData(
                label: listData[i]['label'].toString(),
                nilai: double.parse(listData[i]['data'].toString())));
          }

          return chartData;
        }
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
            title: ChartTitle(text: 'Total Kekurangan Berkas Berdasarkan Jenis Berkas'),
            // legend:
            //     Legend(isVisible: true, position: LegendPosition.bottom),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              PieSeries<IssueData, String>(
                radius: '70%',
                dataSource: getChartData(),
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
      },
    );
  }
}
class IssueData {
  final String? label;
  final double? nilai;

  IssueData({this.label, this.nilai});
}
