import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wave extends StatelessWidget {
  const Wave({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        // width: double.infinity,
        height: 100,
        color: Colors.red,
        child: const Center(
          child: Text('Wave', style: TextStyle(color: Colors.red, fontSize: 21),),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(50, 50);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }
}
