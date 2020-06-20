import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  bool _loading = false;
  bool get loading => _loading;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
}
