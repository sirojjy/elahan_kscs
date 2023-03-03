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
        judul: 'Dashboard',
      ),
      body: SafeArea(
        child: (HawkFabMenu(
          icon: AnimatedIcons.menu_arrow,
          fabColor: primaryColor,
          iconColor: Colors.white,
          hawkFabMenuController: hawkFabMenuController,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children:  const [
                  SizedBox(height: 10,),

                  SliderCard(),
                  SizedBox(height: 10,),

                  ProgresTanahAll(),
                  SizedBox(height: 10,),

                  KlasifikasiJenisTanah(),
                  SizedBox(height: 10,),

                  TotalProgresKeseluruhan(),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          ),

          ///BUTTON MENU
          items: [
            HawkFabMenuItem(
              label: 'Inventarisasi',
              ontap: () {
                Navigator.pushNamed(context, CustomRoutes.inventarisasi);
              },
              icon: const Icon(Icons.add_a_photo),
            ),
          ],
        )
      )),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => MenuButton1(context),
      //   );
      // },
      // child: Icon(Icons.menu),),
    );
  }
}
