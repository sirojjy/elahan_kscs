import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:elahan_kscs/custom_routes.dart';
import 'package:elahan_kscs/menu/inventarisasi/bloc/inventarisasi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';
import '../../../dashboard/screen/menu_utama.dart';

class Inventarisasi extends StatefulWidget {
  const Inventarisasi({Key? key}) : super(key: key);

  @override
  State<Inventarisasi> createState() => _InventarisasiState();
}

class _InventarisasiState extends State<Inventarisasi> {
  SharedPreferences? pref;

  @override
  void initState() {
    BlocProvider.of<InventarisasiBloc>(context).add(ViewInventarisasi());
  }

  void getPref() async {
    pref = await SharedPreferences.getInstance();
  }

  ///Sidebar
  Widget adminScaffold(BuildContext context, Widget body) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Inventarisasi'),
        actions: <Widget>[
          SizedBox(
            width: 50,
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: (){
                Navigator.pushReplacementNamed(context,'/inventarisasi');
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
        selectedRoute: '/inventarisasi',
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
    return adminScaffold(context,
    Scaffold(
      body: BlocBuilder<InventarisasiBloc, InventarisasiState>(
        builder: (context, state){
          return Container(
            child: state.dataInventarisasi.isNotEmpty ?
            ListView.builder(
                itemCount: state.dataInventarisasi.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, CustomRoutes.detailInventarisasi);
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${state.dataInventarisasi[index].nama}'),
                          Text('Luas : ${state.dataInventarisasi[index].luasTanah}'),
                          Text('KTP : ${state.dataInventarisasi[index].noKtp ?? '-'}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Desa :${state.dataInventarisasi[index].kelurahan}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          Text('${state.dataInventarisasi[index].statusSave}'),
                          SizedBox(width: 5,),
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                          //   decoration: BoxDecoration(color: Colors.redAccent),
                          //   child: state.dataInventarisasi.isNotEmpty ?
                          //   Text('0', style: TextStyle(color: Colors.white),)
                          //       : SizedBox()
                          // ),
                        ],
                      ),
                    ),
                  );
                }
            )
                : Text('Data Kosong')
          );
        },
      ),
    ));
  }
}

class DaftarInventarisasi{
  String namaPenerima;
  String ktp;
  String desa;
  String status;
  String issue;
  DaftarInventarisasi({
    required this.namaPenerima,
    required this.ktp,
    required this.desa,
    required this.issue,
    required this.status});
}

List<DaftarInventarisasi> inventarisasi = [
  // DaftarInventarisasi(namaPenerima: "namaPenerima", ktp: "ktp", desa: "desa", issue: "issue", status: "status"),
  DaftarInventarisasi(namaPenerima: 'AHMAD YUSUF', ktp: '1024785947818',desa: 'ANYAR',issue: '0', status: 'Inventarisasi'),
  DaftarInventarisasi(namaPenerima: 'BUDI UTOMO', ktp: '1024785947818',desa: 'ANYAR',issue: '2', status: 'Inventarisasi'),
  DaftarInventarisasi(namaPenerima: 'DANDI PARWONO', ktp: '1024785947818',desa: 'ANYAR',issue: '1', status: 'Inventarisasi'),
  DaftarInventarisasi(namaPenerima: 'EKA KURNIAWATI', ktp: '1024785947818',desa: 'ANYAR',issue: '1', status: 'Inventarisasi'),
];