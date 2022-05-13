import 'package:webview/_features.dart';

class HeatmapData {
  const HeatmapData({
    this.points3D = const <Point3d>[],
    this.radius = 34,
    this.blur = 20,
    required this.gradient,
    this.max = 1,
  });

  final List<Point3d> points3D;
  final int radius;
  final int blur;
  final Map<double, String> gradient;
  final int max;
}

extension HeatmapDataExt on HeatmapData {
  String get convertPoints3dToJs {
    final buffer = StringBuffer('[');

    for (var i = 0; i < points3D.length; i++) {
      final item = points3D[i];
      buffer.write('[${item.position.x},${item.position.y},${item.value}]');

      if (i != (points3D.length - 1)) buffer.write(',');
    }

    buffer.write(']');

    return buffer.toString();
  }

  String get convertGradientToJs {
    final buffer = StringBuffer();

    gradient.forEach(
      (key, value) => buffer.write('$key:"$value",'),
    );

    final value = buffer.toString();

    return '{${value.substring(0, value.length - 1)}}';
  }
}
