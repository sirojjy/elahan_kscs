import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../../constant.dart';
import '../../dashboard/screen/menu_utama.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  // late List<LatLng> filledPoints =[];
  // Future<void> _loadGeoJSON(String file) async {
  //   final jsonString = await rootBundle.loadString('assets/bidang/9498.geojson');
  //   final geojson = json.decode(jsonString);
  //   final coordinates = geojson['features'][0]['geometry']['coordinates'][0];
  //   setState(() {
  //     filledPoints.addAll(coordinates
  //         .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
  //         .toList());
  //   });
  // }

  ///mengambil geojson dari folder
  // late List<List<LatLng>> filledPointsList = [];
  // Future<void> _loadGeoJSON(String filename) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = directory.path + '/assets/bidang/';
  //   final dir = Directory(path);
  //   await dir.list().forEach((file) async {
  //     if (file.path.endsWith('.geoJson')) {
  //       final jsonString = await rootBundle.loadString(file.path);
  //       final geojson = json.decode(jsonString);
  //       final coordinates = geojson['features'][0]['geometry']['coordinates'][0];
  //       final filledPoints = coordinates
  //           .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
  //           .toList();
  //       setState(() {
  //         filledPointsList.add(filledPoints);
  //         print('data : $filledPointsList');
  //       });
  //     }
  //   },
  //   );}

    ///mengambil geojson dari list manual

  late List<List<LatLng>> filledPointsList = [];
    List<String> nisList = [];
    List<String> statusList = [];
    List<double> luasList = [];

    Future<void> _loadGeoJSON(String filename) async {
      final jsonString = await rootBundle.loadString('assets/bidang/$filename');
      if (jsonString != null) {
        final geojson = json.decode(jsonString);
        final feature = geojson['features'][0];
        final coordinates = feature['geometry']['coordinates'][0];
        final filledPoints = coordinates
            .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
            .toList();
        final properties = feature['properties'];
        final nis = geojson['features'][0]['properties']['NIS'];
        final status = properties['STATUS'];
        final luas = properties['LUAS'];
        print('nis $nis');
        print('status $status');
        print('luas $luas');
        setState(() {
          filledPointsList.add(filledPoints);
          nisList.add(nis ?? '');
          statusList.add(status ?? '');
          luasList.add(luas ?? 0);
        });
      }
    }
    @override
  void initState() {
    super.initState();
    ///daftar file geo json yang dipanggil
    final fileList = ["9498.geojson","9520.geojson","9521.geojson","9522.geojson","9523.geojson","9524.geojson","9525.geojson","9526.geojson","9527.geojson","9528.geojson","9529.geojson","9530.geojson","9531.geojson","9532.geojson","9533.geojson","9584.geojson","9586.geojson","9589.geojson","9590.geojson","9591.geojson","9592.geojson","9593.geojson","9595.geojson","9596.geojson","9598.geojson","9602.geojson","9603.geojson","9605.geojson","9606.geojson","9607.geojson","9608.geojson","9612.geojson","9613.geojson","9615.geojson","9616.geojson","9617.geojson","9618.geojson","9620.geojson","9622.geojson","9627.geojson","9629.geojson","9630.geojson","9631.geojson","9632.geojson","9633.geojson","9634.geojson","9635.geojson","9636.geojson","9637.geojson","9638.geojson","9639.geojson","9643.geojson","9646.geojson","9674.geojson","9676.geojson","9677.geojson","9678.geojson","9679.geojson","9680.geojson","9681.geojson","9682.geojson","9683.geojson","9684.geojson","9685.geojson","9686.geojson","9687.geojson","9688.geojson","9689.geojson","9690.geojson","9691.geojson","9692.geojson","9694.geojson","9695.geojson","9697.geojson","9698.geojson","9699.geojson","9700.geojson","9701.geojson","9705.geojson","9706.geojson","9709.geojson","9710.geojson","9713.geojson","9714.geojson","9715.geojson","9717.geojson","9718.geojson","9719.geojson","9720.geojson","9721.geojson","9727.geojson","9728.geojson","9729.geojson","9730.geojson","9731.geojson","9732.geojson","9733.geojson","9734.geojson","9749.geojson","9755.geojson","9764.geojson","9770.geojson","9771.geojson","9778.geojson","9780.geojson","9795.geojson","9799.geojson","9801.geojson","9804.geojson","9805.geojson","9807.geojson","9809.geojson","9818.geojson","9823.geojson","9825.geojson","9826.geojson","9827.geojson","9828.geojson","9829.geojson","9830.geojson","9831.geojson","9833.geojson","9834.geojson"];
    for (final file in fileList) {
      _loadGeoJSON(file);
    }
  }

  Widget adminScaffold(BuildContext context, Widget body) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Profil'),
        actions: <Widget>[
          SizedBox(
            width: 50,
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: (){
                Navigator.pushReplacementNamed(context,'/profil');
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
        selectedRoute: '/profil',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
      ),
      body: body,
    );
  }

  Widget build(BuildContext context) {
    // final polygonPoints = filledPoints ?? [];
    return adminScaffold(context,
       SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text ("Profile"),
              Container(
                padding: EdgeInsets.all(10),
                height: 500,
                color: Colors.grey,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(
                        -6.398649960024949, 106.3233937643756), // koordinat pusat peta
                    zoom: 17.0, // level zoom
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
                    for (final polygonPoints in filledPointsList)
                      if (polygonPoints.isNotEmpty) PolygonLayer(
                        polygons: [
                          Polygon(
                            points: polygonPoints,
                            isFilled: true,
                            color: Colors.blue,
                            borderColor: Colors.purple,
                            borderStrokeWidth: 1,
                            label: '$nisList',
                          )
                        ],
                      )
                    /// LOKASI TappablePolylineLayer

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


// TappablePolylineLayer(
// polylines: [
// TaggedPolyline(
// points: polygonPoints,
// color: Colors.transparent,
// strokeWidth: 20.0,
// tag: '001',
// ),
// ],
// onTap: (point, polyline) {
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// title: Center(child: Text('Data Bidang')),
// content: IntrinsicHeight(
// child: Column(
// children: [
// Table(
// columnWidths: const <int, TableColumnWidth>{
// 0: IntrinsicColumnWidth(),
// 1: FlexColumnWidth(),
// },
// children: <TableRow>[
// TableRow(children: [
// SizedBox(
// height: 30,
// child: Padding(
// padding: const EdgeInsets.only(right: 30),
// child: Text(
// 'Desa',
// style: Theme.of(context)
//     .textTheme
//     .bodyLarge,
// ),
// ),
// ),
// SizedBox(
// height: 30,
// child: Text(
// ': CIUYAH',
// style:
// Theme.of(context).textTheme.bodyLarge,
// ),
// ),
// ]),
// TableRow(children: [
// SizedBox(
// height: 30,
// child: Padding(
// padding: const EdgeInsets.only(right: 30),
// child: Text(
// 'NIB',
// style: Theme.of(context)
//     .textTheme
//     .bodyLarge,
// ),
// ),
// ),
// SizedBox(
// height: 30,
// child: Text(
// ': 00086',
// style:
// Theme.of(context).textTheme.bodyLarge,
// ),
// ),
// ]),
// TableRow(children: [
// SizedBox(
// height: 30,
// child: Padding(
// padding: const EdgeInsets.only(right: 30),
// child: Text(
// 'Nama Pemilik',
// style: Theme.of(context)
//     .textTheme
//     .bodyLarge,
// ),
// ),
// ),
// SizedBox(
// height: 30,
// child: Text(
// ': ANIBAH',
// style:
// Theme.of(context).textTheme.bodyLarge,
// ),
// ),
// ]),
// TableRow(children: [
// SizedBox(
// height: 30,
// child: Padding(
// padding: const EdgeInsets.only(right: 30),
// child: Text(
// 'Jenis Tanah',
// style: Theme.of(context)
//     .textTheme
//     .bodyLarge,
// ),
// ),
// ),
// SizedBox(
// height: 30,
// child: Text(
// ': Tanah Warga',
// style:
// Theme.of(context).textTheme.bodyLarge,
// ),
// ),
// ]),
// TableRow(children: [
// SizedBox(
// height: 30,
// child: Padding(
// padding: const EdgeInsets.only(right: 30),
// child: Text(
// 'Luas Tanah',
// style: Theme.of(context)
//     .textTheme
//     .bodyLarge,
// ),
// ),
// ),
// SizedBox(
// height: 30,
// child: Text(
// ': 660 m2',
// style:
// Theme.of(context).textTheme.bodyLarge,
// ),
// ),
// ]),
// ],
// ),
// ElevatedButton(
// onPressed: () {Navigator.pushNamed(context, CustomRoutes.detailInventarisasi);}, child: Text('Lihat Detail'))
// ],
// ),
// ),
// actions: [
// TextButton(
// onPressed: () => Navigator.of(context).pop(),
// child: Text('OK'),
// ),
// ],
// );
// },
// );
// },
// ),

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
