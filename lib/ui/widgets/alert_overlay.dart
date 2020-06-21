import 'package:flutter/material.dart';
import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';
import '../../extensions/strings.dart';

/// A modal overlay that will show over your child widget (fullscreen) when the show value is true
///
/// Wrap your scaffold in this widget and set show value to model.isBusy to show a loading modal when
/// your model state is Busy
class AlertOverlay extends StatefulWidget {
  final Widget child;
  final List<Widget> alertContent;
  final bool show;

  AlertOverlay({
    @required this.child,
    @required this.alertContent,
    this.show = false,
  });

  @override
  _AlertOverlayState createState() => _AlertOverlayState();
}

class _AlertOverlayState extends State<AlertOverlay> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: <Widget>[
          widget.child,
          IgnorePointer(
            ignoring: !widget.show,
            child: Opacity(
              opacity: widget.show ? 1.0 : 0.0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 40),
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.alertContent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

alertDialogContent({String title, String message, Function onTap}) {
  return [
    Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (!title.isNullOrEmpty()) ...[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                verticalSpace(10),
              ],
              if (!message.isNullOrEmpty()) ...[
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    verticalSpace(10),
    ClipOval(
      child: Material(
        color: primaryColor, // button color
        child: InkWell(
          splashColor: Colors.blue, // inkwell color
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          onTap: onTap,
        ),
      ),
    ),
  ];
}
