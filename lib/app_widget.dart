import 'package:avangers_order/src/ui/components/custom_error.dart';
import 'package:avangers_order/src/ui/helpers/theme_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'src/data/services/custom_localization/custom_localization.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final title = 'Avengers App';

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        supportedLocales: CustomLocalization.supportedLocales,
        localizationsDelegates: [
          CustomLocalizationDelegate(isTest: false),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: title,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      );
    }

    return MaterialApp.router(
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        return widget!;
      },
      theme: ThemeHelper.getTheme(),
      debugShowCheckedModeBanner: false,
      locale: CustomLocalization.defaultLocale,
      supportedLocales: CustomLocalization.supportedLocales,
      localizationsDelegates: [
        CustomLocalizationDelegate(isTest: false),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: title,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
