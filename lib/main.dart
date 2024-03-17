import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:sftp_client/config.dart';
import 'package:sftp_client/route.dart' as my_route;
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get System Theme
  SystemTheme.fallbackColor = Colors.blue;
  await SystemTheme.accentColor.load();
  // Init Window Manager
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setPreventClose(true);
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalConfig(),
      builder: (context, child) {
        final config = context.watch<GlobalConfig>();
        return FluentApp.router(
          title: 'SFTP Client',
          debugShowCheckedModeBanner: false,
          color: config.color,
          themeMode: config.mode,
          darkTheme: FluentThemeData(
            brightness: Brightness.dark,
            accentColor: config.color,
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(
              glowFactor: is10footScreen(context) ? 2.0 : 0.0,
            ),
          ),
          theme: FluentThemeData(
            accentColor: config.color,
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(
              glowFactor: is10footScreen(context) ? 2.0 : 0.0,
            ),
          ),
          locale: config.locale,
          builder: (context, child) => child!,
          routeInformationParser: my_route.router.routeInformationParser,
          routerDelegate: my_route.router.routerDelegate,
          routeInformationProvider: my_route.router.routeInformationProvider,
        );
      },
    );
  }
}
