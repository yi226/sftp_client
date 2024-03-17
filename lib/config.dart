import 'package:fluent_ui/fluent_ui.dart';
import 'package:system_theme/system_theme.dart';

class GlobalConfig extends ChangeNotifier {
  /// Single instance
  factory GlobalConfig() => _getInstance();
  factory GlobalConfig.init() => _getInstance();
  static GlobalConfig? _instance;
  static GlobalConfig get instance => _getInstance();
  static GlobalConfig _getInstance() {
    _instance ??= GlobalConfig._internal();
    return _instance!;
  }

  /// initialize
  GlobalConfig._internal() {
    _init();
  }

  _init() {}

  AccentColor get systemAccentColor {
    return AccentColor.swatch({
      'darkest': SystemTheme.accentColor.darkest,
      'darker': SystemTheme.accentColor.darker,
      'dark': SystemTheme.accentColor.dark,
      'normal': SystemTheme.accentColor.accent,
      'light': SystemTheme.accentColor.light,
      'lighter': SystemTheme.accentColor.lighter,
      'lightest': SystemTheme.accentColor.lightest,
    });
  }

  AccentColor? _color;
  AccentColor get color => _color ?? systemAccentColor;
  set color(AccentColor color) {
    _color = color;
    notifyListeners();
  }

  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;
  set mode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  Locale? _locale;
  Locale? get locale => _locale;
  set locale(Locale? locale) {
    _locale = locale;
    notifyListeners();
  }
}
