import 'dart:math';

class Point3d {
  const Point3d({
    this.position = const Point<double>(0.0, 0.0),
    this.value = 0.0,
  });

  final Point<double> position;
  final double value;
}
