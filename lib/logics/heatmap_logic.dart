import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:webview/_features.dart';

class HeatmapLogic {
  const HeatmapLogic();

  double _convertNum({required num? value}) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    throw Exception('Conversion impossible.');
  }

  Future<HeatmapData> createHeatmapFromAssets({
    String source = 'assets/json/heatmap1.json',
  }) async {
    final json = await rootBundle.loadString(source);
    final map = jsonDecode(json) as Map<String, dynamic>;
    final data = (map['heatmap'] as List<dynamic>? ?? List<dynamic>.empty())
        .cast<Map<String, dynamic>>()
        .map(
          (e) => Point3d(
            position: Point<double>(
              _convertNum(value: e['x'] as num?),
              _convertNum(value: e['y'] as num?),
            ),
            value: _convertNum(value: e['value'] as num?),
          ),
        )
        .toList(growable: false);

    return HeatmapData(
      points3D: data,
      gradient: <double, String>{
        0.8: 'blue',
        0.85: 'green',
        0.9: 'yellow',
        0.95: 'orange',
        1: 'red',
      },
    );
  }
}
