import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';

class ActionCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  final Function onTap;

  const ActionCard({
    Key key,
    this.icon,
    this.title,
    this.bgColor,
    this.textColor,
    this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/$icon.svg",
                  color: iconColor,
                ),
                horizontalSpace(10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      height: 1.2,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 11,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: primaryColor,
        ),
      ),
    );
  }
}
