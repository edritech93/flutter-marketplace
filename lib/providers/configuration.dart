import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/storage.dart';

class Configuration with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    Storage().setConfigTheme(mode.toString());
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<ThemeMode>('_themeMode', _themeMode));
  }
}
