import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:elahan_kscs/constant.dart';
import 'package:flutter/material.dart';

class DetailInventarisasi extends StatefulWidget {
  const DetailInventarisasi({Key? key}) : super(key: key);

  @override
  State<DetailInventarisasi> createState() => _DetailInventarisasiState();
}

class _DetailInventarisasiState extends State<DetailInventarisasi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: MyAppBar(
              judul: 'Detail Bidang',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      'AHMAD YUSUF',
                      style: TextStyle(fontSize: 30),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 250,
                        child: Image.asset('assets/images/IMG_2772.jpg')),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      'Identitas Penerima',
                      style: TextStyle(fontSize: 24),
                    )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(3)
                        },
                        children: [
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('NIS'),
                            ),
                            Container(
                              height: 30,
                              child: Text(': 10'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('Nama'),
                            ),
                            Container(
                              height: 30,
                              child: Text(': AHMAD YUSUF'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('No. KTP'),
                            ),
                            Container(
                              height: 30,
                              child: Text(': 1024785947818'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('Desa'),
                            ),
                            Container(
                              height: 30,
                              child: Text(': ANYAR'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('Alamat'),
                            ),
                            Container(
                              height: 30,
                              child: Text(
                                  ': Jl. SURABAYA NO.17, MENTENG, JAKARTA PUSAT'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('No. Alas Hak'),
                            ),
                            Container(
                              height: 30,
                              child: Text(': 592.2/292/TA-PEM/VI/2021'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('Luas Trase'),
                            ),
                            Container(
                              height: 30,
                              child: Text(': 367 m2'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('Nilai UGK'),
                            ),
                            Container(
                              height: 30,
                              child: Text(': Rp. 310.000.000'),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: 30,
                              child: Text('Status'),
                            ),
                            Container(
                              height: 30,
                              child: Text(
                                ': Terbayar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Table(
                        columnWidths: {0: FlexColumnWidth(3), 1: FlexColumnWidth(1)},
                        children: [
                          TableRow(children: [
                            Container(height: 30, child: Text('Daftar Inventarisasi'),),
                            Container(color: primaryColor, padding: EdgeInsets.all(2),child: Text('View', style: TextStyle(color: Colors.white),),)
                          ])
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}
