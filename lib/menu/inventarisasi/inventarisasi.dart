import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:flutter/material.dart';

class Inventarisasi extends StatefulWidget {
  const Inventarisasi({Key? key}) : super(key: key);

  @override
  State<Inventarisasi> createState() => _InventarisasiState();
}

class _InventarisasiState extends State<Inventarisasi> {
  final List<String> namaPenerima = ['AHMAD YUSUF','BUDI UTOMO','DANDI PARWONO','EKA KURNIAWATI'];
  final List<String> ktp = ['1024785947818','100023754658192','100200195847382','101000238475829'];
  final List<String> desa = ['ANYAR','ANYAR','ANYAR','ANYAR'];
  final List<String> status = ['Inventarisasi','Inventarisasi','Musyawarah','Pembayaran'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: MyAppBar(judul: 'Inventarisasi',),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(''),
                      Text(
                        '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      // Text(
                      //   '${state.data[index].jenisDok}',
                      //   style: const TextStyle(fontSize: 14),
                      // ),
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
  String? namaPenerima;
  String? ktp;
  String? desa;
  String? status;
  DaftarInventarisasi({this.namaPenerima, this.ktp, this.desa, this.status});
}

List<DaftarInventarisasi> inventarisasi = [
  DaftarInventarisasi(namaPenerima: 'AHMAD YUSUF', ktp: '1024785947818',desa: 'ANYAR', status: 'Inventarisasi'),
  DaftarInventarisasi(namaPenerima: 'BUDI UTOMO', ktp: '1024785947818',desa: 'ANYAR', status: 'Inventarisasi'),
  DaftarInventarisasi(namaPenerima: 'DANDI PARWONO', ktp: '1024785947818',desa: 'ANYAR', status: 'Inventarisasi'),
  DaftarInventarisasi(namaPenerima: 'EKA KURNIAWATI', ktp: '1024785947818',desa: 'ANYAR', status: 'Inventarisasi'),
];