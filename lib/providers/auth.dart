import 'package:flutter/foundation.dart';

import '../services/storage.dart';

class Auth with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isLogin = false;
  bool get isLogin => _isLogin;

  void checkTokenAuth() async {
    String? token = await Storage().getToken();
    if (token != null) {
      _isLogin = true;
    } else {
      _isLogin = false;
    }
    notifyListeners();
  }

  void setTokenAuth(String token, String refreshToken) {
    Storage().setToken(token);
    Storage().setRefreshToken(refreshToken);
    _isLogin = true;
    notifyListeners();
  }

  void removeTokenAuth() {
    Storage().removeToken();
    Storage().removeRefreshToken();
    _isLogin = false;
    notifyListeners();
  }
}
