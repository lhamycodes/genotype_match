import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  String _alertDialogTitle = "", _alertDialogMessage = "";
  String get alertDialogTitle => _alertDialogTitle;
  String get alertDialogMessage => _alertDialogMessage;

  Function _alertDialogOnClose;
  Function get alertDialogOnClose => _alertDialogOnClose;

  bool _showAlertDialog = false;
  bool get showAlertDialog => _showAlertDialog;

  bool _busy = false;
  bool get busy => _busy;

  bool _loading = false;
  bool get loading => _loading;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setShowAlertDialog(
    bool value, {
    String title,
    String message,
    Function onClose,
  }) {
    _showAlertDialog = value;
    if (value) {
      _alertDialogTitle = title;
      _alertDialogMessage = message;
      _alertDialogOnClose = onClose;
    } else {
      _alertDialogTitle = "";
      _alertDialogMessage = "";
      _alertDialogOnClose = () {};
    }
    notifyListeners();
  }
}
