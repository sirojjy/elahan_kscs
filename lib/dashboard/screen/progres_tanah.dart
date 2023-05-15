import 'package:elahan_kscs/dashboard/component/donut_chart_bidang.dart';
import 'package:elahan_kscs/dashboard/component/donut_chart_luas.dart';
import 'package:elahan_kscs/dashboard/component/gis.dart';
import 'package:elahan_kscs/dashboard/component/gis2.dart';
import 'package:elahan_kscs/dashboard/component/title_card_component.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
class ProgresTanahAll extends StatelessWidget {
  const ProgresTanahAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TitleCardComponent(
            titleCard: 'PROGRES PENGADAAN TANAH',
            color1: secondaryColor,
            color2: fourthColor,
          ),
          // SizedBox(height: 10,),
          // GisMap(),

          SizedBox(height: 10,),
          DonutChartBidang(),

          SizedBox(height: 10,),
          DonutChart(),

          SizedBox(height: 10,),
          GisMap(),
        ],
      ),
    );
  }
}
