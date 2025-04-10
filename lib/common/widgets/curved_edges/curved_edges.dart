import 'package:flutter/material.dart';

class TCustomCurvedEdges  extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    //Todo: implement getClip
    // throw UnimplementedError();
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);
    
    final secondFirstCurve = Offset(0, size.height-20);
    final secondLastCurve = Offset(size.width-30, size.height -20);

    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(thirdFirstCurve.dx, thirdLastCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    //Todo: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}