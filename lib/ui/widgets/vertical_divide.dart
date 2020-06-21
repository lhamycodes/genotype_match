import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class VerticalDivide extends StatelessWidget {
  final double height;

  const VerticalDivide({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1.2,
      decoration: BoxDecoration(
        color: grey,
      ),
    );
  }
}
