// import 'dart:html';

import 'dart:async';

import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:elahan_kscs/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailInventarisasi extends StatefulWidget {
  const DetailInventarisasi({Key? key}) : super(key: key);

  @override
  State<DetailInventarisasi> createState() => _DetailInventarisasiState();
}

class _DetailInventarisasiState extends State<DetailInventarisasi> {
  final Completer<GoogleMapController> _controller = Completer();
  
  List<LatLng> polygonPoints = const [
    LatLng(-6.198730, 106.839972),
    LatLng(-6.198874, 106.840041),
    LatLng(-6.198733, 106.840333),
    LatLng(-6.198562, 106.840239),
  ];

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
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      'AHMAD YUSUF',
                      style: TextStyle(fontSize: 30),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 250,
                        child: Image.asset('assets/images/IMG_2772.jpg')),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      'Identitas Penerima',
                      style: TextStyle(fontSize: 24),
                    )),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(3)
                        },
                        children: const [
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('NIS'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(': 10'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('Nama'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(': AHMAD YUSUF'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('No. KTP'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(': 1024785947818'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('Desa'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(': ANYAR'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('Alamat'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                  ': Jl. SURABAYA NO.17, MENTENG, JAKARTA PUSAT'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('No. Alas Hak'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(': 592.2/292/TA-PEM/VI/2021'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('Luas Trase'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(': 367 m2'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('Nilai UGK'),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(': Rp. 310.000.000'),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: 30,
                              child: Text('Status'),
                            ),
                            SizedBox(
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

                    ///DAFTAR ASET
                    const SizedBox(height: 20,),
                    const Center(
                        child: Text(
                          'Daftar Aset',
                          style: TextStyle(fontSize: 24),
                        )),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        DataTable(
                          // columnSpacing: 10,
                          columns: const <DataColumn>[
                            DataColumn(label: Expanded(
                              child: Text('Nama Aset'),
                            )),
                            DataColumn(label: Expanded(
                              child: Text('Jumlah'),
                            )),
                            DataColumn(label: Expanded(child: Text('Keterangan'))),
                          ],
                          rows: const <DataRow>[
                            DataRow(cells: <DataCell>[
                              DataCell(Text('Sebidang Tanah')),
                              DataCell(Text('367 m2')),
                              DataCell(Text('-')),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(Text('Mangga')),
                              DataCell(Text('10 Pohon')),
                              DataCell(Text('Produktif')),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(Text('Rambutan')),
                              DataCell(Text('15 Pohon')),
                              DataCell(Text('Produktif')),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(Text('Jengkol')),
                              DataCell(Text('6 Pohon')),
                              DataCell(Text('Produktif')),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(Text('Pisang')),
                              DataCell(Text('27 Pohon')),
                              DataCell(Text('Produktif')),
                            ]),
                          ],
                        ),
                      ],
                    ),

                    ///DAFTAR FOTO
                    const SizedBox(height: 20,),
                    const Center(
                        child: Text(
                          'Dokumentasi Aset',
                          style: TextStyle(fontSize: 24),
                        )),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(child: Image.asset('assets/images/aset1.jpg')),
                        SizedBox(width: 10,),
                        Expanded(child: Image.asset('assets/images/aset2.jpg')),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(child: Image.asset('assets/images/aset3.jpg')),
                        SizedBox(width: 10,),
                        Expanded(child: Image.asset('assets/images/aset4.jpg')),
                      ],
                    ),

                    const SizedBox(height: 20,),
                    const Center(
                        child: Text(
                          'Kelengkapan Dokumen',
                          style: TextStyle(fontSize: 24),
                        )),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        DataTable(
                          columnSpacing: 10,
                          columns: const <DataColumn>[
                            DataColumn(label: Expanded(
                              child: Text('Tahapan'),
                            )),
                            DataColumn(label: Expanded(
                              child: Text('File'),
                            )),
                            DataColumn(label: Expanded(child: Text('Tanggal Upload'))),
                          ],
                          rows: <DataRow>[
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Daftar Inventarisasi')),
                              DataCell(Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)),
                              const DataCell(Text('01-03-2023')),
                            ]),
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Identitas Penerima')),
                              DataCell(Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)),
                              const DataCell(Text('01-03-2023')),
                            ]),
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Dokumen Alas Hak')),
                              DataCell(Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)),
                              const DataCell(Text('01-03-2023')),
                            ]),
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Laporan Hasil Penilaian')),
                              DataCell(Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)),
                              const DataCell(Text('01-03-2023')),
                            ]),
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Peta Bidang')),
                              DataCell(Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)),
                              const DataCell(Text('01-03-2023')),
                            ]),
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Validasi P2T')),
                              DataCell(Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)),
                              const DataCell(Text('01-03-2023')),
                            ]),
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Surat Perintah Pembayaran')),
                              DataCell(Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)),
                              const DataCell(Text('01-03-2023')),
                            ]),
                            DataRow(cells: <DataCell>[
                              const DataCell(Text('Dokumen Pendukung')),
                              DataCell(
                                Center(child: Text('None'),)
                                  // Container(color: primaryColor, padding: const EdgeInsets.all(2),child: const Text('View', style: TextStyle(color: Colors.white),),)
                              ),
                              const DataCell(Text('01-03-2023')),
                            ]),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20,),
                    const Center(
                        child: Text(
                          'Lokasi Aset',
                          style: TextStyle(fontSize: 24),
                        )),
                    const SizedBox(height: 10,),
                    ///GOOGLE MAP
                    Container(
                      height: 300,
                      child: GoogleMap(
                        markers: Set<Marker>.from([
                          Marker(
                            markerId: MarkerId("AHMAD YUSUF"),
                            position: LatLng(-6.1987719,106.8400998),
                            icon: BitmapDescriptor.defaultMarker,
                          ),
                        ]),
                        initialCameraPosition: CameraPosition(
                            target: LatLng(-6.198895, 106.840121,),
                            zoom: 18),
                        polygons: {
                          Polygon(
                              polygonId: PolygonId('1'),
                            points: polygonPoints,
                            fillColor: Color(0xFF006491).withOpacity(0.2),
                            strokeWidth: 2
                          ),
                        },
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
