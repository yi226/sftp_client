import 'package:fluent_ui/fluent_ui.dart';
import 'package:sftp_client/widgets/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with PageMixin {
  bool selected = true;
  String? comboboxValue;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Fluent UI for Flutter Showcase App'),
      ),
      children: [FlutterLogo()],
    );
  }
}
