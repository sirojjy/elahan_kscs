import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
// import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';
// import 'package:latlng/latlng.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class GisMap extends StatefulWidget {
   GisMap({Key? key}) : super(key: key);
  @override
  State<GisMap> createState() => _GisMapState();
}

class _GisMapState extends State<GisMap> {
  late MapShapeSource _dataSource;
  @override
  void initState() {
    _dataSource = const MapShapeSource.network(
      'http://www.json-generator.com/api/json/get/bVqXoJvfjC?indent=2',
      shapeDataField: 'name',
    );
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
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
        child: SfMaps(
          layers: [
            MapShapeLayer(source: _dataSource),
          ],
        )
      // FlutterMap(
      //   options: MapOptions(
      //     center: LatLng(-6.1754, 106.8272),
      //     // center: LatLng(116.725376867973, -0.962617696290662),
      //     zoom: 5,
      //   ),
      //   children: [
      //     TileLayer(
      //       urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      //       userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      //     ),
      //     PolygonLayer(
      //       polygonCulling: false,
      //       polygons: [
      //         Polygon(
      //             points: [
      //               LatLng(116.725376867973, -0.962617696290662),
      //               LatLng(116.725383870535, -0.962680947800484),
      //               LatLng(116.725361972984, -0.962680955721901),
      //               LatLng(116.725358658856, -0.962632562405222),
      //               LatLng(116.725356113994, -0.962610169593126),
      //               LatLng(116.725376867973, -0.962617696290662),
      //
      //             ],
      //             // points: dataGis["features"][0]["geometry"]["coordinates"][0],
      //             color: Colors.blueAccent
      //         ),
      //       ],
      //     )
      //   ],
      // )
    );
  }
}

Map<String, dynamic> dataGis = {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              116.725376867973,
              -0.962617696290662
            ],
            [
              116.725383870535,
              -0.962680947800484
            ],
            [
              116.725361972984,
              -0.962680955721901
            ],
            [
              116.725358658856,
              -0.962632562405222
            ],
            [
              116.725356113994,
              -0.962610169593126
            ],
            [
              116.725376867973,
              -0.962617696290662
            ]
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
