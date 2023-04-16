import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
// import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:latlng/latlng.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class GisMap2 extends StatefulWidget {
   GisMap2({Key? key}) : super(key: key);
  @override
  State<GisMap2> createState() => _GisMap2State();
}

class _GisMap2State extends State<GisMap2> {
  late List<Model> _data;
  late MapShapeSource _mapSource;
  late MapZoomPanBehavior _zoomPanBehavior;
  late MapShapeSource _sublayerSource;
  late MapShapeSource _mapShapeSource;


  void initState() {
    // _mapSource = MapShapeSource.asset(
    //   'assets/gis/9426.json',
    //   shapeDataField: 'coordinates',
    //   dataCount: _data.length,
    //   primaryValueMapper: (int index) => _data[index].state,
    //   dataLabelMapper: (int index) => _data[index].stateCode,
    //   shapeColorValueMapper: (int index) => _data[index].color,
    // );
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
  Widget build(BuildContext context) {

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
      // MapShapeLayer(
      //   source: _mapSource,
      //   showDataLabels: true,
      //   legend: const MapLegend(MapElement.shape),
      //   tooltipSettings: MapTooltipSettings(
      //       color: Colors.grey[700],
      //       strokeColor: Colors.white,
      //       strokeWidth: 2),
      //   strokeColor: Colors.white,
      //   strokeWidth: 0.5,
      //   shapeTooltipBuilder: (BuildContext context, int index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text(
      //         _data[index].stateCode,
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //     );
      //   },
      //   dataLabelSettings: MapDataLabelSettings(
      //     textStyle: TextStyle(
      //         color: Colors.black,
      //         fontWeight: FontWeight.bold,
      //         fontSize:
      //         Theme.of(context).textTheme.bodySmall!.fontSize),
      //   ),
      // ),
        child:
        FlutterMap(
          options: MapOptions(
            center: LatLng(-7.24917, 112.75083), // koordinat pusat peta
            zoom: 13.0, // level zoom
          ),
          children: [
            // TileLayerOptions(
            //   urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            //   subdomains: ['a', 'b', 'c'],
            // ),
            // PolygonLayerOptions(
            //   polygons: [
            //     Polygon(
            //       points: [
            //         LatLng(-7.24917, 112.75083),
            //         LatLng(-7.24917, 112.78083),
            //         LatLng(-7.27917, 112.78083),
            //         LatLng(-7.27917, 112.75083),
            //       ],
            //       color: Colors.blue.withOpacity(0.3),
            //       borderColor: Colors.blue.withOpacity(0.7),
            //       borderStrokeWidth: 2,
            //       builder: (context) => Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             label,
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               color: Colors.black,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        )
        // SfMaps(
        //   layers: [
        //     // MapTileLayer(
        //     //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        //     //   initialZoomLevel: 3,
        //     //   initialFocalLatLng: MapLatLng(35, 0),
        //     //   // controller: _zoomPanBehavior,
        //     // ),
        //     MapShapeLayer(
        //       source: MapShapeSource.asset(
        //         'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // berisi data bentuk kotak dalam format GeoJSON
        //         // shapeDataField: 'coordinates',
        //       ),
        //       // properti untuk menampilkan bentuk kotak di atas peta
        //       color: Colors.red,
        //       strokeWidth: 2,
        //       strokeColor: Colors.black,
        //     ),
        //   ],
        // ),
        // SfMaps(
        //   layers: <MapLayer>[
        //     // MapShapeLayer(source: const MapShapeSource.asset("assets/world_map.json",
        //     MapTileLayer(
        //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        //       initialFocalLatLng: MapLatLng(-6.3522,106.6251),
        //       initialZoomLevel: 3,
        //       zoomPanBehavior: _zoomPanBehavior,
        //     ),
        //     MapShapeLayer(
        //       source: const MapShapeSource.asset("https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        //       // shapeDataField: "coordinates",
        //       ),
        //     // sublayers: [
        //     //   MapShapeSublayer(
        //     //     source: MapShapeSource.asset(
        //     //       'assets/gis/africa.json',
        //     //       shapeDataField: 'name',
        //     //     ),
        //     //   )
        //     // ],
        //     ),
        //
        //   ],
        // ),
    );
  }
}

List<List<List<double>>> rectangleCoordinates = [
  [
    [-6.2969, 106.393],
    [-6.2532, 106.3628],
    [-6.2177, 106.4067],
    [-6.2122, 106.4616],
    [-6.2409, 106.5049],
    [-6.3112, 106.5303]
  ]
];

/// Collection of Australia state code data.
class Model {
  /// Initialize the instance of the [Model] class.
  const Model(this.state, this.color, this.stateCode);

  /// Represents the Australia state name.
  final String state;

  /// Represents the Australia state color.
  final Color color;

  /// Represents the Australia state code.
  final String stateCode;
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
