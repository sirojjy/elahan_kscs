import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:elahan_kscs/constant.dart';
import 'package:elahan_kscs/custom_routes.dart';
import 'package:elahan_kscs/dashboard/screen/klasifikasi_jenis_tanah.dart';
import 'package:elahan_kscs/dashboard/screen/progres_tanah.dart';
import 'package:elahan_kscs/dashboard/screen/kabupaten.dart';
import 'package:elahan_kscs/dashboard/screen/total_progres_keseluruhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

import '../../menu/menu_button.dart';
import '../../profile/screen/profil.dart';
import 'menu_utama.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void onChanged(String value) {
    // Lakukan sesuatu ketika opsi dropdown berubah
    print(value);
  }
  Widget adminScaffold(BuildContext context, Widget body) {
    String? selectedOption;

    List<String> options = [
      'Lebak',
      'Serang',
      'Tangerang',
    ];
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Dashboard'),
        actions: <Widget>[
          SizedBox(
            width: 100,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedOption,
                icon: Icon(Icons.tune, color: Colors.white,),
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                  onChanged(value!);
                },
                isExpanded: true,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi Logout'),
                      content: Text('Apakah Anda yakin ingin logout?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Batal'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Logout'),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/logout', (route) => false);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      sideBar: SideBar(
        backgroundColor: sideColor,
        activeBackgroundColor: sideColor1,
        borderColor: sideColor3,
        iconColor: sideColorWhite,
        activeIconColor: fourthColor,
        textStyle: const TextStyle(
          color: sideColorWhite,
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: fourthColor,
          fontSize: 13,
        ),
        items: adminMenuItems,
        // ModalRoute.of(context)?.settings.name ??
        selectedRoute: '/dashboard',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
      ),
      body: body,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return adminScaffold(
      context,
        const SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children:  [
                  SizedBox(height: 10,),
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Center(child: Text('Total Progres Keseluruhan', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),),
                  // ),
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
