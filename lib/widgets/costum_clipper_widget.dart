import 'package:flutter/widgets.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height - 48.0)
      ..quadraticBezierTo(
          size.width * 0.25, size.height, size.width * 0.50, size.height - 48.0)
      ..quadraticBezierTo(
          size.width * 0.75, size.height - 96.0, size.width, size.height - 48.0)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
