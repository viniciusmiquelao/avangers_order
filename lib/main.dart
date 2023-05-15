import 'package:avangers_order/src/data/helpers/storage_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'src/avengers_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.to.addListener(() {
    debugPrint('Current route: ${Modular.to.path}');
  });

  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    StorageHelper.init(),
  ]);

  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => ModularApp(
        module: AvengersModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
