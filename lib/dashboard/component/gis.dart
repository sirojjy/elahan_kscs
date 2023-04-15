import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
// import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';
// import 'package:latlng/latlng.dart';

class GisMap extends StatelessWidget {
  GisMap({Key? key}) : super(key: key);

  List<Marker> markerMap = [
    Marker(
      point: LatLng (30, 40),
      width: 80,
      height: 80,
      builder: (context) => FlutterLogo(),
    ),
  ];

  @override
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
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(116.725376867973, -0.962617696290662),
          zoom: 5,
        ),
        children: [
          PolygonLayer(
            polygonCulling: false,
            polygons: [
              Polygon(
                  points: dataGis["features"][0]["geometry"]["coordinates"][0],
                  color: Colors.blueAccent
              ),
            ],
          )
        ],
      )
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
