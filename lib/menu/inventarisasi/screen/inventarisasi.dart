import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:elahan_kscs/custom_routes.dart';
import 'package:flutter/material.dart';

class Inventarisasi extends StatefulWidget {
  const Inventarisasi({Key? key}) : super(key: key);

  @override
  State<Inventarisasi> createState() => _InventarisasiState();
}

class _InventarisasiState extends State<Inventarisasi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: MyAppBar(judul:'Inventarisasi',),
      body: Container(
        child: ListView.builder(
            itemCount: inventarisasi.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, CustomRoutes.detailInventarisasi);
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${inventarisasi[index].namaPenerima}'),
                      Text('KTP : ${inventarisasi[index].ktp}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Desa :${inventarisasi[index].desa}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  trailing: Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                        decoration: BoxDecoration(color: Colors.redAccent),
                        child: Text(inventarisasi[index].issue, style: TextStyle(color: Colors.white),),
                      ),
                      SizedBox(width: 5,),
                      Text('${inventarisasi[index].status}')
                    ],
                  ),
                ),
              );
            }
        ),
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