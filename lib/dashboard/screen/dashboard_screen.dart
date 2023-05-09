import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:elahan_kscs/constant.dart';
import 'package:elahan_kscs/custom_routes.dart';
import 'package:elahan_kscs/dashboard/screen/klasifikasi_jenis_tanah.dart';
import 'package:elahan_kscs/dashboard/screen/progres_tanah.dart';
import 'package:elahan_kscs/dashboard/screen/kabupaten.dart';
import 'package:elahan_kscs/dashboard/screen/total_progres_keseluruhan.dart';
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

import '../../menu/menu_button.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(
        judul: 'Dashboard KSCS',
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children:  const [
                SizedBox(height: 10,),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Total Progres Keseluruhan', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),),
                ),
                ProgresTanahAll(),
                SizedBox(height: 10,),

                TotalProgresKeseluruhan(),
                SizedBox(height: 10,),

                SliderCard(),
                SizedBox(height: 10,),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Klasifikasi Jenis Tanah per Kabupaten', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),),
                ),
                KlasifikasiJenisTanah(),
                SizedBox(height: 10,),
              ],
            ),
          ),
        )
      ),
    );
  }
}

// List<HawkFabMenuItem> itemsMenu = [
//   HawkFabMenuItem(
//     label: 'Dashboard',
//     ontap: () {
//       Navigator.pushNamed(CustomRoutes.dashboard);
//     },
//     icon: const Icon(Icons.dashboard),
//   ),
//   HawkFabMenuItem(
//     label: 'Inventarisasi',
//     ontap: () {
//       Navigator.pushNamed( CustomRoutes.inventarisasi);
//     },
//     icon: const Icon(Icons.analytics),
//   ),
// ];
