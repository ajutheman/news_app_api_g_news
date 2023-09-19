import 'package:flutter/material.dart';

class ImageVeiw extends StatefulWidget {
  String? imageUrl;

  ImageVeiw({
    super.key,
    this.imageUrl,
  });

  @override
  State<ImageVeiw> createState() => _ImageVeiwState();
}

class _ImageVeiwState extends State<ImageVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: 300,
          height: 200,
        ),
        Container(
          child: Image.network(widget.imageUrl.toString()),
          margin: EdgeInsets.all(10),
          height: 320,
          width: 444,
          color: Colors.white12,
        ),
      ],
    ));
  }
}
