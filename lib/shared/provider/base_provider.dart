import 'package:flutter/material.dart';

/// All providers can extend BaseProvider so as to inherit the
/// methods that will set status of the tasks.
class BaseProvider with ChangeNotifier {
  Map<String, dynamic> data = <String, dynamic>{};
  Map<String, Status> status = {"main": Status.idle};
  Map<String, String> error = {};

  setStatus(String function, Status _status) {
    status[function] = _status;
    notifyListeners();
  }

  setData(String function, dynamic _data) {
    data[function] = _data;
  }

  setError(String function, String _error, [Status? _status]) {
    // ignore: unnecessary_null_comparison
    if (_error != null) {
      error[function] = _error;
      status[function] = Status.error;
    } else {
      error[function] = _error;
      status[function] = _status ?? Status.error;
    }
    notifyListeners();
  }

  reset(String function) {
    data.remove(function);
    error.remove(function);
    status.remove(function);
  }

  resetMultipleStatus(List<String> status) {
    for (var e in status) {
      data.remove(e);
      error.remove(e);
      this.status.remove(e);
    }
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }
}

enum Status { idle, loading, done, error }
