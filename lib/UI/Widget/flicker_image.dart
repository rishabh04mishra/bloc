import 'package:flutter/material.dart';

class FlickerImage extends StatelessWidget {
  //const FlickerImage({ Key? key }) : super(key: key);
  final String imageUrl;

  FlickerImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          // ignore: unnecessary_brace_in_string_interps
          image: NetworkImage("${imageUrl}"),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
