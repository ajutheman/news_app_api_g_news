import 'package:flutter/material.dart';

class CurvedBottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedBottomClipper(), // Custom clipper for curved bottom
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/img.png'),
            fit: BoxFit.cover,
          ),
        ),
        // color: Colors.black, // You can set a background color if needed
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); // Start at the top-left
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    ); // Define the curved part
    path.lineTo(size.width, 0); // Continue to the top-right
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
