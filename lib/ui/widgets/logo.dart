import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final String logoName;
  final Color bgColor;
  final Color logoColor;
  final double size;

  const Logo({
    Key key,
    this.logoName,
    this.bgColor,
    this.logoColor,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: bgColor,
      ),
      child: SvgPicture.asset(
        'assets/images/$logoName.svg',
        color: logoColor,
      ),
    );
  }
}
