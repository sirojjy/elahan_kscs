import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import '../../custom_routes.dart';

class ProfileUser extends StatefulWidget {
  ProfileUser({Key? key}) : super(key: key);
  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  late List<LatLng> filledPoints =[];
  Future<void> _loadGeoJSON() async {
    final jsonString = await rootBundle.loadString('assets/bidang/9498.geojson');
    final geojson = json.decode(jsonString);
    final coordinates = geojson['features'][0]['geometry']['coordinates'][0];
    setState(() {
      filledPoints.addAll(coordinates
          .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
          .toList());
    });
  }

  @override
  void initState() {
    super.initState();
    _loadGeoJSON();
  }

  Widget build(BuildContext context) {

    final polygonPoints = filledPoints ?? [];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(judul: 'Profil',),
              Text ("Profile"),
              Container(
                padding: EdgeInsets.all(10),
                height: 500,
                color: Colors.grey,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(
                        -6.398649960024949, 106.3233937643756), // koordinat pusat peta
                    zoom: 18.0, // level zoom
                  ),
                  children: [
                    MarkerLayer(
                      markers: [
                        Marker(
                            point: LatLng(-0.962617696290662, 116.725376867973),
                            builder: (context) => Container(
                                child: const Text(
                                  'BELUM',
                                  style: TextStyle(color: Colors.white),
                                )
                            )
                        )
                      ],
                    ),
                    TileLayer(
                      // urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      // userAgentPackageName: 'com.example.elahan_kscs',
                      urlTemplate: "https://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                    ),
                    if (filledPoints.isNotEmpty) PolygonLayer(
                      polygons: [
                        Polygon(
                          points: polygonPoints,
                          isFilled: true,
                          color: Colors.blue,
                          borderColor: Colors.purple,
                          borderStrokeWidth: 1,
                          label: '001',
                        ),
                      ],
                      polygonCulling: true,
                    ),
                    /// LOKASI TappablePolylineLayer
                    TappablePolylineLayer(
                      polylines: [
                        TaggedPolyline(
                          points: polygonPoints,
                          color: Colors.transparent,
                          strokeWidth: 20.0,
                          tag: '001',
                        ),
                      ],
                      onTap: (point, polyline) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(child: Text('Data Bidang')),
                              content: IntrinsicHeight(
                                child: Column(
                                  children: [
                                    Table(
                                      columnWidths: const <int, TableColumnWidth>{
                                        0: IntrinsicColumnWidth(),
                                        1: FlexColumnWidth(),
                                      },
                                      children: <TableRow>[
                                        TableRow(children: [
                                          SizedBox(
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: Text(
                                                'Desa',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Text(
                                              ': CIUYAH',
                                              style:
                                              Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          SizedBox(
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: Text(
                                                'NIB',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Text(
                                              ': 00086',
                                              style:
                                              Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          SizedBox(
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: Text(
                                                'Nama Pemilik',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Text(
                                              ': ANIBAH',
                                              style:
                                              Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          SizedBox(
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: Text(
                                                'Jenis Tanah',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Text(
                                              ': Tanah Warga',
                                              style:
                                              Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          SizedBox(
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: Text(
                                                'Luas Tanah',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            child: Text(
                                              ': 660 m2',
                                              style:
                                              Theme.of(context).textTheme.bodyLarge,
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {Navigator.pushNamed(context, CustomRoutes.detailInventarisasi);}, child: Text('Lihat Detail'))
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),

                  ],
                )
              ),
            ]
          ),
        ),
      ),
    );
  }
}

// final filledPoints = <LatLng>[
//   LatLng(-6.398649960024949, 106.3233937643756),
//   LatLng(-6.398763238150509, 106.3233745287781),
//   LatLng(-6.398784296084945, 106.3234502506137),
//   LatLng(-6.398755122203054, 106.3236111839551),
//   LatLng(-6.398711762324687, 106.3236267121281),
//   LatLng(-6.398649960024949, 106.3233937643756),
// ];
// final polylinePoints = filledPoints
//     .map((point) => LatLng(point.latitude, point.longitude))
//     .toList();

// class GetJsonData{
//   GetJsonData({
//     this.id
// })
// }
