import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  //const Description({ Key? key }) : super(key: key);
  final title;
  final subTitle;
  Description(this.title, this.subTitle);
  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 80,
        child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan[900]),
      ),
      subtitle: subTitle == null ? Text("Not Available") : Text(subTitle),
    ));
  }
}
