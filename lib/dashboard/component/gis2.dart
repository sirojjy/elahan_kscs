import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:latlng/latlng.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'dart:convert';
import 'dart:io';
import 'package:geojson/geojson.dart' as geojson;
import '../../custom_routes.dart';

class GisMap2 extends StatefulWidget {
  GisMap2({Key? key}) : super(key: key);
  @override
  State<GisMap2> createState() => _GisMap2State();
}

class _GisMap2State extends State<GisMap2> {
  late MapShapeSource _mapSource;
  late MapZoomPanBehavior _zoomPanBehavior;
  late MapShapeSource _sublayerSource;
  late MapShapeSource _mapShapeSource;

  void initState() {
    _zoomPanBehavior = MapZoomPanBehavior()
      ..zoomLevel = 3
      ..maxZoomLevel = 10
      ..minZoomLevel = 2
      ..enableDoubleTapZooming = true
      ..enablePinching = true;
    super.initState();
    _sublayerSource = const MapShapeSource.asset(
      'assets/gis/africa.json',
      shapeDataField: 'name',
    );
  }

  // final filledPoints1 = <LatLng>[
  //   LatLng(116.725376867973, -0.962617696290662),
  //   LatLng(116.725383870535, -0.962680947800484),
  //   LatLng(116.725361972984, -0.962680955721901),
  //   LatLng(116.725358658856, -0.962632562405222),
  //   LatLng(116.725356113994, -0.962610169593126),
  //   LatLng(116.725376867973, -0.962617696290662),
  // ];
  // final reversedPoints = filledPoints1.map((point) => LatLng(point.longitude, point.latitude)).toList();

  // void main() {
  //   final file = File('assets/gis/9426.json');
  //   final jsonString = file.readAsStringSync();
  //   final jsonData = json.decode(jsonString);
  //   final coordinates = jsonData['features'][0]['geometry']['coordinates'][0];
  //   final newCoordinates = coordinates.map((coord) => [coord[1], coord[0]]);
  //   print(newCoordinates);
  //   final filledPoints = List<LatLng>.from(coordinates[0].map((coord) => LatLng(coord[1], coord[0])).toList());}

  Widget build(BuildContext context) {
    // List<List<LatLng>> polygons = filledPoints1.map((list) => list.map((item) => LatLng(item[0], item[1])).toList()).toList();

    // final List<LatLng> filledPoints;
    final filledPoints = <LatLng>[
      LatLng(-6.398649960024949, 106.3233937643756),
      LatLng(-6.398763238150509, 106.3233745287781),
      LatLng(-6.398784296084945, 106.3234502506137),
      LatLng(-6.398755122203054, 106.3236111839551),
      LatLng(-6.398711762324687, 106.3236267121281),
      LatLng(-6.398649960024949, 106.3233937643756),
    ];
    final polylinePoints = filledPoints
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();
    // print('Data Koordinat $polylinePoints');
    return Container(
        padding: EdgeInsets.all(5),
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
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
                            child: Text(
                          'BELUM',
                          style: TextStyle(color: Colors.white),
                        )))
              ],
            ),
            TileLayer(
              // urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              // userAgentPackageName: 'com.example.elahan_kscs',
              urlTemplate: "https://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",
              subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
            ),
            PolygonLayer(
              polygons: [
                Polygon(
                  points: filledPoints,
                  isFilled: true,
                  color: Colors.blue,
                  borderColor: Colors.purple,
                  borderStrokeWidth: 1,
                  label: '001',
                ),
              ],
              polygonCulling: true,
            ),
            TappablePolylineLayer(
              polylines: [
                TaggedPolyline(
                  points: polylinePoints,
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
    );
  }
}

final List<List<LatLng>> filledPoints1 = [
  [
    LatLng(-6.398600896612856, 106.3232008981308),
    LatLng(-6.398609816985756, 106.3229678611842),
    LatLng(-6.3986375061213, 106.322926889285),
    LatLng(-6.398666919051033, 106.3229189190535),
    LatLng(-6.398725423902157, 106.3232383743614),
    LatLng(-6.398763238150509, 106.3233745287781),
    LatLng(-6.398649960024949, 106.3233937643756),
    LatLng(-6.398647093730627, 106.3233829989978),
    LatLng(-6.398606877474382, 106.3232313794564),
    LatLng(-6.398600896612856, 106.3232008981308),
  ],
  [
    LatLng(-6.398649960024949, 106.3233937643756),
    LatLng(-6.398763238150509, 106.3233745287781),
    LatLng(-6.398784296084945, 106.3234502506137),
    LatLng(-6.398755122203054, 106.3236111839551),
    LatLng(-6.398711762324687, 106.3236267121281),
    LatLng(-6.398649960024949, 106.3233937643756),
  ],
  [
    LatLng(-6.398711762324687, 106.3236267121281),
    LatLng(-6.398755122203054, 106.3236111839551),
    LatLng(-6.398789436599978, 106.3237718286943),
    LatLng(-6.398751800371166, 106.32377724641),
    LatLng(-6.398711762324687, 106.3236267121281),
  ],
  [
    LatLng(-6.398755122203054, 106.3236111839551),
    LatLng(-6.398784296084945, 106.3234502506137),
    LatLng(-6.398792898453762, 106.3234811907147),
    LatLng(-6.398868884324338, 106.3237551277899),
    LatLng(-6.398789436599978, 106.3237718286943),
    LatLng(-6.398755122203054, 106.3236111839551),
  ]
];

final filledPoints2 = <LatLng>[
  LatLng(-6.398649960024949, 106.3233937643756),
  LatLng(-6.398763238150509, 106.3233745287781),
  LatLng(-6.398784296084945, 106.3234502506137),
  LatLng(-6.398755122203054, 106.3236111839551),
  LatLng(-6.398711762324687, 106.3236267121281),
  LatLng(-6.398649960024949, 106.3233937643756),
];

final filledPoints3 = <LatLng>[
  LatLng(-6.398711762324687, 106.3236267121281),
  LatLng(-6.398755122203054, 106.3236111839551),
  LatLng(-6.398789436599978, 106.3237718286943),
  LatLng(-6.398751800371166, 106.32377724641),
  LatLng(-6.398711762324687, 106.3236267121281),
];

final filledPoints4 = <LatLng>[
  LatLng(-6.398755122203054, 106.3236111839551),
  LatLng(-6.398784296084945, 106.3234502506137),
  LatLng(-6.398792898453762, 106.3234811907147),
  LatLng(-6.398868884324338, 106.3237551277899),
  LatLng(-6.398789436599978, 106.3237718286943),
  LatLng(-6.398755122203054, 106.3236111839551),
];

Map<String, dynamic> dataGis = {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [116.725376867973, -0.962617696290662],
            [116.725383870535, -0.962680947800484],
            [116.725361972984, -0.962680955721901],
            [116.725358658856, -0.962632562405222],
            [116.725356113994, -0.962610169593126],
            [116.725376867973, -0.962617696290662]
          ]
        ]
      },
      "properties": {
        "fill-opacity": 0,
        "stroke-opacity": 1,
        "stroke": "#ff0000",
        "TEXTSTRING": "Syarak",
        "NIS": 51,
        "STATUS": "BELUM",
        "LUAS": 0.00169781389,
        "ALAS_HAK": "SKT/Segel"
      }
    }
  ]
};
