import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path=Path();

    path.lineTo(0,0 );
    path.lineTo(0, size.height);
    path.lineTo(size.width,size.height/2);
    path.close();

    return path;


  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}