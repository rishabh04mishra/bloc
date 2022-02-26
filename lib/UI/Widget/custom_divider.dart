import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  double indent = 0;
  double endIndent = 0;
  CustomDivider([this.indent, this.endIndent]);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: indent,
      endIndent: endIndent,
      color: Colors.grey[400],
    );
  }
}
