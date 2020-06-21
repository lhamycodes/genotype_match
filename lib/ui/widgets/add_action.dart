import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';
import '../../extensions/strings.dart';
import 'vertical_divide.dart';

class AddAction extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String label;
  final Function onTap;
  final IconData icon;
  final bool border;

  const AddAction({
    Key key,
    this.bgColor = grey,
    this.icon = Icons.add,
    this.title,
    this.label,
    this.onTap,
    this.border = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (border) ...[
          DottedBorder(
            color: grey,
            strokeWidth: 1,
            borderType: BorderType.Circle,
            padding: EdgeInsets.all(7),
            child: button(),
          ),
        ] else ...[
          button()
        ],
        if (!label.isNullOrEmpty()) ...[
          verticalSpace(5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        if (border) ...[
          verticalSpace(5),
          VerticalDivide(height: 40),
        ]
      ],
    );
  }

  Widget button() {
    return ClipOval(
      child: Material(
        color: bgColor,
        child: InkWell(
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
