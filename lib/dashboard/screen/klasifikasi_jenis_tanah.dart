import 'package:flutter/material.dart';

import '../component/pie_chart.dart';

class KlasifikasiJenisTanah extends StatelessWidget {
  const KlasifikasiJenisTanah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          PieChartComponent()
        ],
      ),
    );
  }
}
